class TechDeals::Scraper

  def self.scrape_items(url="/deals-1")
    #Scrapes each item on selected page and returns the list of items as an array of objects
    doc = Nokogiri::HTML(open("https://www.dealsource.tech#{url}"))
    items = []

    doc.css('div.summary-item').each{|item|
      deal = TechDeals::Items.new
      deal.name = item.css('div.summary-title a').text
      deal.url = item.css('div.summary-title a').attribute('href').value
      deal.fullPrice = item.css('div.summary-excerpt p').text.split(" ")[1]
      deal.salePrice = item.css('div.summary-excerpt p').text.split(" ")[3]
      hold = item.css('div.summary-excerpt p strong').text.split(" ")
      hold.shift
      deal.promo = hold.join(" ").gsub(/[()]/, "")

      items << deal
      }

    items
  end

  def self.scrape_categories
    doc = Nokogiri::HTML(open('https://www.dealsource.tech/deals-1'))
    categories = []

    doc.css('a.sqs-block-button-element--medium').each{|category|
      cats = TechDeals::Categories.new
      cats.name = category.text
      cats.url = category.attribute('href').value.to_s

      categories << cats}
    categories
  end
end
