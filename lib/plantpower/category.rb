class Plantpower::Category
  attr_accessor :name, :url, :recipes
  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @recipes = []
    @@all << self
  end

  def self.all
    @@all
  end

  def add_recipe(recipe)
    @recipes << recipe
  end
end
