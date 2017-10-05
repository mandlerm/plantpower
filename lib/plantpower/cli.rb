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
  def int_test?(choice)
    begin
      Integer(choice)
      true
    rescue
      false
    end
  end


#STILL DOESN"T CHECK IF NUMBER IS AN OPTION -- NEED categories.length
  def display_categories
    #prints out categories in numbered list
    length = 4
    puts
    puts "************* Recipe Categories *************"
    puts
    puts "1. beverages"
    puts "2. breakfast"
    puts "3. lunch"
    puts "4. dinner"
    puts
    puts "Enter the number for which recipe category would you like to see?"
    print "> "
    choice = gets.chomp

      if int_test?(choice) && choice.to_i < length
        # && choice.to_i < categories.length  >>> add this to above statement to check that number selected is an option
        display_choices(choice)
      else
        puts "^^^^^^^^^^^^^^"
        puts "Not a valid selection.  Please try again."
        display_categories
      end
  end

  def display_choices(food)
    #case statements. if 1 --> display x
    length = 2
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
  end

#type = breakfast,dinner, etc.  NEED TO CHECK LENGTH OF list
#selection = which # of that type
# 1. confirm that selection is an Integer
# 2. confirm that the integer is in the list of options for THAT category
# 3. Display recipe information for that integer selection of that category
    def show_recipe(type, selection)
      #display the recipe item chosed
      # puts "#{recipe.name}"
      # puts "#{recipe.time}   ------ #{recipe.servings}"
      # puts "#{recipe.instruction}"
      # puts
      # puts "Bon Apetite"
    end
  end
