require './book'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'
require './write_file'
require 'json'
require './read_file'
require './data'

class App
  attr_reader :data
  def initialize
    @data = Data.new
    @writer_file = Write_File.new
    begin
      Read_File.new(@data).read_files
    rescue Errno::ENOENT
      puts 'No data file found.'
    end
  end

  def list_books
    puts 'List of all books'
    @data.books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    puts ''
  end

  def list_people
    puts 'List of all people'
    @data.persons.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    puts ''
  end

  def create_person # rubocop:disable Metrics/MethodLength
    puts 'Which type of person you wish to create'
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
      print 'Classroom: '
      classroom = gets.chomp
      print 'Has parent permission? [Y/N]: '
      permission = gets[0]
      permission = (permission == ('Y' || 'y'))
      student = Student.new(classroom, age, name, permission)
      @data.persons << student
      @writer_file.persons(classroom, age, name, permission)
      puts "Person created successfully \n\n"

    when 2
      print 'Specialization: '
      specialization = gets.chomp
      @data.persons << Teacher.new(specialization, age, name)
      @writer_file.persons(specialization, age, name)
      puts "Person created successfully\n\n"
    end
  end

  def create_book
    puts 'Create a book'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @data.books << Book.new(title, author)
    @writer_file.books(title, author)
    puts "Book created successfully\n\n"
  end

  def create_rental
    puts 'Create rental'
    puts 'Select a book from the following list by number'
    @data.books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    book_number = gets.chomp.to_i
    puts 'Select a Person from the following list by number'
    @data.persons.each_with_index do |person, index|
      puts " #{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_number = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    @data.rentals << Rental.new(date, @data.books[book_number], @data.persons[person_number])
    @writer_file.rentals(date, book_number, person_number)
    puts "Rental created successfully \n\n"
  end

  def list_rentals
    puts 'List all rentals'
    print 'Enter ID of person: '
    person_id = gets.chomp
    puts 'Rentals : '
    @data.rentals.each do |rent|
      if rent.person.id.to_s == person_id.to_s
        puts "#{rent.class} #{rent.date} | Book: \"#{rent.book.title}\" rented by #{rent.person.name}"
      end
    end
  end
end
