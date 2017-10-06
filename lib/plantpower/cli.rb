class Plantpower::CLI

  def call
    puts "Welcome to the McDougall recipe collection"
    display_categories

    puts "Would you like to search for a new recipe? y/n \n"
    print "> "
    again = gets.chomp
    if again.include?('n')
      puts "**** Thanks for stopping by.  Bon Appetite. **** "
      puts
    else
      call
    end
  end

#HOW DO I PASS THIS VALUE BACK TO USE THIS TEST FOR MULTIPLE USER INPUTS?
  def int_test(choice)
    length = 4
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
    print "> "
    choice = gets.chomp
    if !int_test(choice)
      puts "^^^^^^^^^^^"
      puts "That is not a valid selection. Please try again"
      display_categories
    end
    display_choices(choice)

  end

  def display_choices(food)
    #case statements. if 1 --> display x
    puts
    case food
    when '1'
      puts "~~~~~~~~~~ BEVERAGES ~~~~~~~~~~"
      puts "1. smoothie"
      puts "2. ice tea"
      puts
      puts "Which recipe would you like to see?"
      print "> "
      choice = gets.chomp
      if !int_test(choice)
        puts "^^^^^^^^^^^"
        puts "That is not a valid selection. Please try again"
        display_choices(food)
      else
        show_recipe('beverage', choice)
      end
    when '2'
      puts "~~~~~~~~~~ BREAKFAST ~~~~~~~~~~"
      puts "1. oatmeal"
      puts "2. pancakes"
      puts
      puts "Which recipe would you like to see?"
      print "> "
      choice = gets.chomp
      if !int_test(choice)
        puts "^^^^^^^^^^^"
        puts "That is not a valid selection. Please try again"
        display_choices(food)
      else
        show_recipe('breakfast', choice)
      end
    when '3'
      puts "~~~~~~~~~~ LUNCH ~~~~~~~~~~"
      puts "1. mac n cheese"
      puts "2. mashed potatos and broccoli"
      puts
      puts "Which recipe would you like to see?"
      print "> "
      choice = gets.chomp
      if !int_test(choice)
        puts "^^^^^^^^^^^"
        puts "That is not a valid selection. Please try again"
        display_choices(food)
      else
        show_recipe('lunch', choice)
      end
    when '4'
      puts "~~~~~~~~~~ DINNER ~~~~~~~~~~"
      puts "1. Shepards pie"
      puts "2. Lentil loaf"
      puts
      puts "Which recipe would you like to see?"
      print "> "
  #IS THIS A PLACE FOR A BLOCK?? YIELD
      choice = gets.chomp
      if !int_test(choice)
        puts "^^^^^^^^^^^"
        puts "That is not a valid selection. Please try again"
        display_choices(food)
      else
        show_recipe('dinner', choice)
      end
    end
  end

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
