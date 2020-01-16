class TechDeals::Scraper

  def self.scrape_page(url="deals-1")
    #Scrapes each item on selected page and returns the list of items as an array of objects
    doc = Nokogiri::HTML(open("https://www.dealsource.tech/#{url}"))
    items = []

    doc.css('div.summary-item').each{|item|
      deal = TechDeals::Deals.new
      deal.name = item.css('div.summary-title a').text
      deal.url = item.css('div.summary-title a').attribute('href').value
      deal.fullPrice = item.css('div.summary-excerpt p').text.split(" ")[1]
      deal.salePrice = item.css('div.summary-excerpt p').text.split(" ")[3]
      hold = item.css('div.summary-excerpt p strong').text.split(" ")
      hold.shift
      deal.promo = hold.join(" ").gsub(/[()]/, "")
      binding.pry
      }
    end
end
