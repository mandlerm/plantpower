class Plantpower::CLI

  def call
    puts "Welcome to the McDougall recipe collection"
    display_categories

    choice = gets.chomp
#NEED to test that entry is a number AND it is valid option
    category = int_test

    display_choices(category)
    puts "Which recipe would you like to see?"
#HOW TO TEST if entry is a number?
    recipe = gets.chomp.to_i

  end
end
#HOW DO I PASS THIS VALUE BACK TO USE THIS TEST FOR MULTIPLE USER INPUTS?
  def int_test(choice)
    begin
      choice = gets.chomp
      food = Integer(choice)
    rescue
      print "Please enter an valid number:"
      retry
      food
      binding.pry
    end
  end



  def display_categories
    #prints out categories in numbered list
    puts
    puts "************* Recipe Categories *************"
    puts
    puts "1. beverages"
    puts "2. breakfast"
    puts "3. lunch"
    puts "4. dinner"
    puts
    puts "Which recipe category would you like to see?"
    choice = gets.chomp
    selection = int_test(choice)
  end

  def display_choices(food)
    #case statements. if 1 --> display x
    puts
    case food
    when '1'
      puts "~~~~~~~~~~ BEVERAGES ~~~~~~~~~~"
      puts "1. smoothie"
      puts "2. ice tea"
    when '2'
      puts "~~~~~~~~~~ BREAKFAST ~~~~~~~~~~"
      puts "1. oatmeal"
      puts "2. pancakes"
    when '3'
      puts "~~~~~~~~~~ LUNCH ~~~~~~~~~~"
      puts "1. mac n cheese"
      puts "2. mashed potatos and broccoli"
    when '4'
      puts "~~~~~~~~~~ DINNER ~~~~~~~~~~"
      puts "1. Shepards pie"
      puts "2. Lentil loaf"
    end

    def show_recipe
      #display the recipe item chosed
      # puts "#{recipe.name}"
      # puts "#{recipe.time}   ------ #{recipe.servings}"
      # puts "#{recipe.instruction}"
      # puts
      # puts "Bon Apetite"
    end
  end
