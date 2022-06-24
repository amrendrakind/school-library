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
