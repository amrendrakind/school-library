def main
  puts('-----------------------------------')
  puts "\nWelcome to OOP School Library App!!\n\n"
  puts('-----------------------------------')

  begin
    menu
    input =  user_input 
  end while input > 0 && input < 8

end

def menu
  puts "\nPlease choose an option by entering a number:\n\n"
  puts '1. List all Books.'
  puts '2. List all People.'
  puts '3. Create a Person.'
  puts '4. Create a Book.'
  puts '5. Create a Rental.'
  puts '6. List all entals for a given person id.'
  puts '7. Exit'
  
end

def user_input
    input = gets.chomp.to_i
    while input > 7 || input < 1
        puts 'Please enter a valid option : '
        input = gets.chomp.to_i
    end
    input
end

main