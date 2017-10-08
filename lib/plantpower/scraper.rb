class Plantpower::Scraper

  attr_accessor :page

  def self.get_page
    Nokogiri::HTML(open("https://www.drmcdougall.com/health/education/recipes/mcdougall-recipes"))
  end

  def self.scrape_categories
    collection = []
    page = get_page

    list = page.css(".break_ul li a").children.text
    list = list.split("\r\n")
    list.shift

    link = page.css(".break_ul li a")
    links = link.map { |l| l.attribute('href').value}
    Hash[list.zip(links)].each do |key, value|
      collection << Plantpower::Category.new(key, value)
    end
  end


  def self.scrape_category_page(url)
    item_list = []
    links = []

    html = open(url)
    choices = Nokogiri::HTML(html)

    list = choices.css(".category_list li a")
    list.each { |l| item_list << l.text }

    list.each { |l| links << l.attribute('href').value}
    second_level = Hash[item_list.zip(links)]
    second_level
  end


#all the elements of a RECIPE OBJECT

  def self.scrape_recipe(recipe_name, url)

    list_item = Nokogiri::HTML(open(url))

    # recipe_name = Plantpower::Recipe.new_from_listing(list_item)

    recipe_name = Plantpower::Recipe.new
    ingred = []
    instr = []

    recipe_name.name = list_item.css("h2.rep-egg").children.text
    recipe_name.prep = list_item.css("h4.item_para").text

    list_item.css(".ingred").each { |l| ingred << l.text.gsub(/\t/, " ")  }
    recipe_name.ingredients = ingred

    list_item.css(".directions p").each {|i| instr << i.text}
    recipe_name.instructions = instr

    recipe_name.url = url
binding.pry
    # recipe_name.save
    # recipe
  end
end
