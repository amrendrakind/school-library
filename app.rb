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
    puts "List of all books"
    @books.each {|book| puts "Title: \"#{book.title}\", Author: #{book.author}"}
    puts ''
  end

  def list_people
    puts "List of all people"
    @persons.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    puts ''
  end

  def create_person
    puts "Which type of person you wish to create"
    puts '1. Student'
    puts '2. Teacher'
    print 'Enter selection: '
    person_type = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Age : '
    age = gets.chomp.to_i
    case person_type
    when 1
      print 'Has parent permission? [Y/N]: '
      permission = gets[0] == ('y' or 'Y')
      puts permission
      @persons << Student.new('Unkown', age, name, permission )
      puts "Person created successfully \n\n"
    when 2
      print 'Specialization: '
      specialization = gets.chomp
      @persons << Teacher.new(specialization, age, name)
      puts "Person created successfully\n\n"
    end
  end

  def create_book
    puts "Create a book"
    print "Title: "
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts "Book created successfully\n\n"
  end

  def create_rental
    puts "create_rental"
  end

  def list_rentals
    puts "list_rentals"
  end
end
