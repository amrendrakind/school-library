def main
  puts('-----------------------------------')
  puts "\nWelcome to OOP School Library App!!\n\n"
  puts('-----------------------------------')
  menu
end

def menu
  puts "\nPlease choose an option by entering a number:\n\n"
  puts '1. List all Books.'
  puts '2. List all People.'
  puts '3. Create a Person.'
  puts '4. Create a Book.'
  puts '5. Create a Rental.'
  puts '6. List all rentals for a given person id.'
  puts '7. Exit'
  gets.chomp
end

main