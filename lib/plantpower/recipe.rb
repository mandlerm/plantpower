class Plantpower::Recipe

  attr_accessor :name, :prep, :ingredients, :instructions

  def self.new_from_listing(recipe)
    self.new(
      r.css("h2").text,
      "http://www.theworlds50best.com#{r.css("a").attribute("href").text}",
      r.css("h3").text,
      r.css(".position").text
      )
  end

  def initialize(name=nil, url=nil, location=nil, position=nil)
    @name = name
    @url = url
    @location = location
    @position = position
    @@all << self
  end



end
