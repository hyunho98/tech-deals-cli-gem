class TechDeals::CLI

  def call
    hello
    list_categories
  end

  def hello
    puts "Hello! Please begin by selecting a category"
  end

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
      list_items
      return
    when 2..(cats.length + 1)
      @url = cats[input-2].url
      list_items
      return
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
        input = "zip"
      loop do
        output = "Press ENTER to view the next 10 items ||"
        lineTwo = "OR input \"EXIT\" to exit the program"

        if i == items.length/10
          output = "Press ENTER to EXIT the program ||"
          lineTwo = "OR input \"C\" to go back to categories"
        end
        if i > 0
          output += " Input -1 to view the last 10 items ||"
        end


        puts "\n#{output} Select an item's number to view its url"
        puts "#{lineTwo}"
        input = gets.strip

        if input.downcase == "exit"
          goodbye
          return #ends the method
        elsif input.downcase == "c"
          list_categories
          return #ends the method
        elsif input == "" || (input.to_i == -1 && i > 0) || (input.to_i > (i*10) && input.to_i <= (i*10+10) && items[input.to_i-1] != nil)
          break
        else
          puts "INVALID INPUT"
        end

      end


      input = input.to_i

      if input == -1 && i > 0
        i -= 2
      elsif input > (i*10) && input <= (i*10+10) && items[input-1] != nil
        puts "SELECTED"
        puts items[input-1].toString
        puts "URL: #{items[input-1].url}"

        loop do
          puts "\nWould you like to view another item? Y/N"
          puts "OR input \"C\" to choose another category"
          input = gets.strip.downcase

          if input == "y"
            list_items
            return #end the method
          elsif input == "c"
            list_categories
            return #break from item input loop
          elsif input == "n"
            goodbye
            return #end the method
          else
            puts "INVALID INPUT"
          end
        end

        break #break from item list loop
      end
      i += 1
    end
    goodbye
  end

  def goodbye
    puts "Goodbye! Hope you found some good deals!"
  end

end
