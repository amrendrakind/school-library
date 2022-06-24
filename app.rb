require './book'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'

class App
  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def select(input)
    case input
    when 1 then list_books
    when 2 then list_people
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_rentals
    when 7 exit
    end
  end

  def list_books
    puts "list_books"
  end

  def list_people
    puts "list_people"
  end

  def create_person
    puts "create_person"
  end

  def create_book
    puts "create_book"
  end

  def create_rental
    puts "create_rental"
  end

  def list_rentals
    puts "list_rentals"
  end
end
