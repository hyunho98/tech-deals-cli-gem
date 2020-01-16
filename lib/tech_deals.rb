require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative './tech_deals/version'
require_relative './tech_deals/scraper'
require_relative './tech_deals/deals'
require_relative './tech_deals/cli'


TechDeals::Scraper.scrape_page
