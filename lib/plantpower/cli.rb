class Plantpower::CLI
  MAIN_PAGE = "https://www.drmcdougall.com/health/education/recipes/mcdougall-recipes"

  attr_accessor :categories
  def call
    puts
    puts "Welcome to the McDougall Recipe Collection"
    category_setup
    display_categories
    receive_input
  end

  def category_setup
    @categories = Plantpower::Recipe.category_list
  end

  def test_for_exit(input)
    if input.include?("exit") || input.include?("q")
      goodbye
    end
  end

  def display_categories
    puts "************* Recipe Categories *************"
    @categories.each_with_index do |item, index|
      puts "#{index + 1}. #{item[0]}"
    end

    length = @categories.length

    puts
    puts "Enter the number for which category of recipes would you like to see?"
    print "> "
    choice = gets.chomp
    test_for_exit(choice)

    if !int_test(choice, length)
          puts "^^^^^^^^^^^"
          puts "That is not a valid selection. Please try again"
          display_categories
    end
    display_choices(choice)
  end


  def display_choices(food)
    food = food.to_i
    key = @categories.keys[food -1 ]

    second_level = Plantpower::Scraper.scrape_category_page("#{MAIN_PAGE}/#{@categories[key]}")
    length = second_level.length
    puts "~~~~~~~~~~ #{key} ~~~~~~~~~~"

    second_level.each_with_index do |items, index|
      puts "#{index + 1}. #{items[0]}"
    end
    puts
    puts "Which recipe would you like to see?"
    print "> "
    choice  = gets.chomp
    test_for_exit(choice)

    if !int_test(choice, length)
      puts "^^^^^^^^^^^"
      puts "That is not a valid selection. Please try again"
      display_choices(food)
    else
      recipe_name = second_level.keys[choice.to_i - 1]
      extension = second_level[recipe_name]
      show_recipe(recipe_name, extension)
    end
  end

  def show_recipe(name, url)

    recipe_name = Plantpower::Scraper.scrape_recipe(name, "#{MAIN_PAGE}/#{url}")
    # recipe = Scraper.scrape_recipe("#{MAIN_PAGE}/#{url}")

    puts "~~~~~~~~~~ #{recipe_name.name} ~~~~~~~~~~"
    puts
    puts recipe_name.prep
    puts
    puts "----------- INGREDIENTS ----------- "
    puts recipe_name.ingredients
    puts
    puts "************** DIRECTIONS **************"
    puts recipe_name.instructions
    puts
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "See more at:"
    puts recipe_name.url
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
  end

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
end
