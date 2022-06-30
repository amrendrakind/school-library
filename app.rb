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
    case person_type
    when 1
      student_parameters = student_input
      student = Student.new(student_parameters[0], student_parameters[1], student_parameters[2], student_parameters[3])
      @data.persons << student
      @writer_file.persons_student('Student', student_parameters[0], student_parameters[1], student_parameters[2], student_parameters[3])
      puts "Person: Student created successfully \n\n"

    when 2
      teacher_parameters = teacher_input
      @data.persons << Teacher.new(teacher_parameters[0], teacher_parameters[1], teacher_parameters[2])
      @writer_file.persons_teacher('Teacher', teacher_parameters[0], teacher_parameters[1], teacher_parameters[2])
      puts "Person: Teacher created successfully\n\n"
    end
  end

  def student_input
    print 'Name: '
    name = gets.chomp
    print 'Age : '
    age = gets.chomp.to_i
    print 'Classroom: '
    classroom = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets[0]
    permission = (permission.downcase == 'y')
    [classroom, age, name, permission]
  end

  def teacher_input
    print 'Name: '
    name = gets.chomp
    print 'Age : '
    age = gets.chomp.to_i
    print 'Specialization: '
    specialization = gets.chomp
    [specialization, age, name]
  end

  def create_book
    book_parameters = book_input
    @data.books << Book.new(book_parameters[0], book_parameters[1])
    @writer_file.books(title, author)
    puts "Book created successfully\n\n"
  end

  def book_input
    puts 'Create a book'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    [title, author]
  end

  def create_rental
    rental_parameters = rental_input
    @data.rentals << Rental.new(rental_parameters[0], @data.books[rental_parameters[1]], @data.persons[rental_parameters[2]])
    @writer_file.rentals(rental_parameters[0], rental_parameters[1], rental_parameters[2])
    puts "Rental created successfully \n\n"
  end

  def rental_input
    puts 'Create rentals:'
    puts 'Select a book from the following list by number'
    @data.books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    book_number = gets.chomp.to_i
    puts 'Select a Person from the following list by number'
    @data.persons.each_with_index do |person, index|
      puts " #{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_number = gets.chomp.to_i
    print 'Enter Date: '
    date = gets.chomp
    [date, book_number, person_number]
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
