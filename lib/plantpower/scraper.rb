class Scraper

  def self.scrape_index_page(index_url)
    collection = []
    categories = {}
    html = open(index_url)
    mcdougall = Nokogiri::HTML(html)

    # category = mcdougall.css(".break_ul li a").children.text
    # binding.pry
    # link_extension = mcdougall.css(".break_ul li a").attribute('href')
    # category.split("\r\n").each do |cat|
    #   categories << cat
    # end

    category = mcdougall.css(".break_ul li a").children.text
    category = category.split("\r\n")
    category.shift
    link = mcdougall.css(".break_ul li a")
    binding.pry
    category.each do |cat|
      link.each do |link|
        binding.pry
        collection << {cat => link.attribute('href').value}
      end
    end

  end
end

# links.each { |one| puts one.attribute('href')}

# class Scraper
#
#   def self.scrape_index_page(index_url)
#     roster = []
#     page = open(index_url)
#     doc = Nokogiri::HTML(page)
#     students = doc.css(".student-card")
#
#     students.each do |student|
#       roster << {:name => student.at(".student-name").text,
#         :location => location = student.at(".student-location").text,
#         :profile_url => profile_url = student.at("a").attributes['href'].value}
#       end
#     roster
#   end
#
#   def self.scrape_profile_page(profile_url)
#     profiles = {}
#     profile = open(profile_url)
#     doc = Nokogiri::HTML(profile)
#     social = doc.css(".social-icon-container a")
#       social.each do
#         |kid|  value = kid.attributes['href'].value
#         case value
#         when /linkedin/
#          profiles[:linkedin] = value
#        when /twitter/
#          profiles[:twitter] = value
#        when /github/
#          profiles[:github] = value
#        else
#          profiles[:blog] = value
#        end
#     end
#
#       profiles[:profile_quote] = doc.css(".profile-quote").text
#       profiles[:bio] = doc.css(".description-holder p").text
#
#     profiles
#   end
# end



#https://www.drmcdougall.com/health/education/recipes/mcdougall-recipes/
