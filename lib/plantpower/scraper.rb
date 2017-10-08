class Scraper

  def self.scrape_index_page(index_url)
    links = []
    html = open(index_url)
    mcdougall = Nokogiri::HTML(html)

    category = mcdougall.css(".break_ul li a").children.text
    category = category.split("\r\n")
    category.shift
    link = mcdougall.css(".break_ul li a")
    link.each { |l| links << l.attribute('href').value}
    first_level = Hash[category.zip(links)]
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

  def self.scrape_recipe(url)
    html = open(url)
    list_item = Nokogiri::HTML(html)

    recipe = {}
    ingred = []
    instr = []

    recipe[:name] = list_item.css("h2.rep-egg").children.text
    recipe[:prep] = list_item.css("h4.item_para").text

    list_item.css(".ingred").each { |l| ingred << l.text.gsub(/\t/, " ")  }
    recipe[:ingredients] = ingred

    list_item.css(".directions p").each {|i| instr << i.text}
    recipe[:instructions] = instr

    recipe
  end
end
