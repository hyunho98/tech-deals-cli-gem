class TechDeals::CLI

  def list_categories
    cats = TechDeals::Scraper.scrape_categories
    puts "1.View All Items"
    cats.each.with_index(2){|category, i|
    puts "#{i}.#{category.name}"}
    puts "Enter the number for the category you would like to select: "

    input = gets.strip.to_i

    case input
    when 1
      @url = "/deals-1"
    when 2..(cats.length + 1)
      @url = cats[input-2].url
    else
      puts "INVALID INPUT"
      list_categories
    end
  end

  def list_items
    items = TechDeals::Scraper.scrape_items(@url)
    i = 0

    while i < (items.length / 10) + 1
      x = 0

      while x < 10
        if items[x+(i*10)] != nil
          puts "#{x+(i*10+1)} #{items[x+(i*10)].toString}"
        end
        x += 1
      end
      puts "Press ENTER to view the next 10 items || Input -1 to view the last 10 items || Select an item's number to view url"
      input = gets.to_i

      if input == -1 && i > 0
        i -= 2
      elsif input > (i*10) && input <= (i*10+10) && items[input-1] != nil
        puts "SELECTED"
        puts items[input-1].toString
        puts "URL: #{items[input-1].url}"

        loop do
          puts "Would you like to view another item? Y/N"
          puts "OR input \"C\" to choose another category"
          input = gets.strip.downcase

          if input == "y"
            list_items
            break
          elsif input == "c"
            list_categories
            break
          elsif input == "n"
            #goodbye
            break
          else
            puts "INVALID INPUT"
          end
        end

        break
      end
      i += 1
    end
  end
  
end
