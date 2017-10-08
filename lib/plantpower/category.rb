class Plantpower::Category
  attr_accessor :category, :url

  def initialize(category, url)
    @category = category
    @url = url
  end
end
