def main
  puts('-----------------------------------')
  puts "\nWelcome to OOP School Library App!!\n\n"
  puts('-----------------------------------')

  loop do
    menu
    input = user_input
    case input
    when 1 then puts 'Entered 1 '
    when 2 then puts 'Entered 2 '
    when 3 then puts 'Entered 3 '
    when 4 then puts 'Entered 4 '
    when 5 then puts 'Entered 5 '
    when 6 then puts 'Entered 6 '
    else break
    end
    break unless input.positive? && input < 8
  end
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
    puts 'Please enter a valid option between 1 to 7: '
    input = gets.chomp.to_i
  end
  input
end

main
