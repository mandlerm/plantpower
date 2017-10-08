class Plantpower::Recipe
  @@all = []
  attr_accessor :name, :prep, :ingredients, :instructions

  def self.new_from_listing(recipe)
list_item = Nokogiri::HTML(open(url))

    self.new(
      r.css("h2").text,
      "http://www.theworlds50best.com#{r.css("a").attribute("href").text}",
      r.css("h3").text,
      r.css(".position").text
      )
  end

  def initialize(name=nil, prep=nil, ingredients=nil, instruction=nil)
    @name = name
    @prep = prep
    @ingredients = ingredients
    @instructions = instructions
    @@all << self
  end

  def self.all
    @@all
  end

  def name
    @name = list_item.css("h2.rep-egg").children.text
  end

  def prep
    @prep = list_item.css("h4.item_para").text
  end

  def ingredients
    list_item.css(".ingred").each { |l| ingred << l.text.gsub(/\t/, " ")  }
    @ingredients = ingred
  end

  def instruction
    list_item.css(".directions p").each {|i| instr << i.text}
    @instructions = instr
  end


end
