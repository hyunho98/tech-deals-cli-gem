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

  def menu
    items = TechDeals::Scraper.scrape_items(@url)
end
