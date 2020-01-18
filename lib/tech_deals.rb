require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative './tech_deals/version'
require_relative './tech_deals/items'
require_relative './tech_deals/categories'
require_relative './tech_deals/scraper'
require_relative './tech_deals/cli'

TechDeals::CLI.new.list_categories
