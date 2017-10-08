class Plantpower::Recipe
  @@all = []
  attr_accessor :name, :prep, :ingredients, :instructions, :url, :category_list

#sets category_list equal to scraped value from scrape_index_page
#do not need to rescrape page, can access this list with .category_list
#??????IS THIS IN THE RIGHT PLACE????????
  def self.category_list
    category_list = Plantpower::Scraper.scrape_categories
    category_list
  end

  def initialize(name=nil, prep=nil, ingredients=nil, instruction=nil)
    @name = name
    @prep = prep
    @ingredients = ingredients
    @instructions = instructions
    # @@all << self
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end


#
#   def self.new_from_listing(recipe)
# list_item = Nokogiri::HTML(open(url))
#
#     self.new(
#       r.css("h2").text,
#       "http://www.theworlds50best.com#{r.css("a").attribute("href").text}",
#       r.css("h3").text,
#       r.css(".position").text
#       )
#   end
#




end
