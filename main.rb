require './app'
require './write_file'

def main # rubocop:disable Metrics/CyclomaticComplexity
  system('cls')
  app = App.new
  write_file = Write_File.new()
  puts('-----------------------------------')
  puts "\nWelcome to OOP School Library App!!\n\n"
  puts('-----------------------------------')

  loop do
    menu
    input = user_input
    case input
    when 1 then app.list_books
    when 2 then app.list_people
    when 3 then app.create_person
    when 4 then app.create_book
    when 5 then app.create_rental
    when 6 then app.list_rentals
    else 
      write_file.close_file
      break
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
