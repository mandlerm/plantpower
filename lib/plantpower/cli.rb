class Plantpower::CLI
  MAIN_PAGE = "https://www.drmcdougall.com/health/education/recipes/mcdougall-recipes"

  @first_level

  def call
    puts
    puts "Welcome to the McDougall recipe collection"
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

    puts "Enter the number for which recipe category would you like to see?"
    print "> "
    choice = gets.chomp
    if !int_test(choice, length)
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

    choice  = gets.chomp
    if !int_test(choice, length)
      puts "^^^^^^^^^^^"
      puts "That is not a valid selection. Please try again"
      display_choices(food)
    else
      puts "moving on"
    end
  end


#type = breakfast,dinner, etc.  NEED TO CHECK LENGTH OF list
#selection = which # of that type
# 1. confirm that selection is an Integer
# 2. confirm that the integer is in the list of options for THAT category
# 3. Display recipe information for that integer selection of that category


  def show_recipe(type, number)
    puts "#{type} #{number}"
    puts

    #display the recipe item chosed
    # puts "#{recipe.name}"
    # puts "#{recipe.time}   ------ #{recipe.servings}"
    # puts "#{recipe.instruction}"
    # puts
    # puts "Bon Apetite"
  end
end
