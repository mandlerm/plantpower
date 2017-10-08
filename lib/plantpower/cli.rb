class Plantpower::CLI
  MAIN_PAGE = "https://www.drmcdougall.com/health/education/recipes/mcdougall-recipes"

  @first_level

  def call
    puts
    puts "Welcome to the McDougall Recipe Collection"
    display_categories
  end


#HOW DO I PASS THIS VALUE BACK TO USE THIS TEST FOR MULTIPLE USER INPUTS?
  def int_test(choice, length)
    begin
      if Integer(choice) && choice.to_i > 0 && choice.to_i <= length
        true
      else
        false
      end
      rescue
      false
    end
  end


#STILL DOESN"T CHECK IF NUMBER IS AN OPTION -- NEED categories.length
  def display_categories
    @first_level = Scraper.scrape_index_page(MAIN_PAGE)

#why is there a leading index of " " ????  What to do about that?
    length = @first_level.length
    puts "************* Recipe Categories *************"
    @first_level.each_with_index do |item, index|
      puts "#{index + 1}. #{item[0]}"
    end
    puts
    puts "Enter the number for which category of recipes would you like to see?"
    print "> "
    choice = gets.chomp
    if choice.include?("exit") || choice.include?("q")
      goodbye
    elsif !int_test(choice, length)
          puts "^^^^^^^^^^^"
          puts "That is not a valid selection. Please try again"
          display_categories
    end
    display_choices(choice)
  end


  def display_choices(food)
    food = food.to_i
    key = @first_level.keys[food -1 ]

    second_level = Scraper.scrape_category_page("#{MAIN_PAGE}/#{@first_level[key]}")
    length = second_level.length
    puts "~~~~~~~~~~ #{key} ~~~~~~~~~~"

    second_level.each_with_index do |items, index|
      puts "#{index + 1}. #{items[0]}"
    end
    puts
    puts "Which recipe would you like to see?"
    print "> "
    choice  = gets.chomp
    if choice.include?("exit") || choice.include?("q")
      goodbye
    elsif !int_test(choice, length)
      puts "^^^^^^^^^^^"
      puts "That is not a valid selection. Please try again"
      display_choices(food)
    else
      recipe_name = second_level.keys[choice.to_i - 1]
      extension = second_level[recipe_name]
      show_recipe(recipe_name, extension)
    end
  end

  def show_recipe(recipe_name, url)

    recipe = Scraper.scrape_recipe("#{MAIN_PAGE}/#{url}")

    puts "~~~~~~~~~~ #{recipe[:name]} ~~~~~~~~~~"
    puts
    puts recipe[:prep]
    puts
    puts "----------- INGREDIENTS ----------- "
    puts recipe[:ingredients]
    puts
    puts "************** DIRECTIONS **************"
    puts recipe[:instructions]
    puts
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "See more at:"
    puts "#{MAIN_PAGE}/#{url}"
    puts
    puts "Would you like to search for another recipe?"
    print "> "
    answer = gets.chomp
    if answer.include?('y' || 'Y')
      Plantpower::CLI.new.call
    else
      goodbye
    end
  end

  def goodbye
    puts
    abort("Bon Appétit")
    puts
  end
end
