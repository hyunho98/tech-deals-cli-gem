class TechDeals::CLI

  def categories
    puts "1.View All Items"
    TechDeals::Scraper.scrape_categories.each.with_index(2){|category, i|
    puts "#{i}.#{category.name}"}
  end
end
