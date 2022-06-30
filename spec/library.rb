require './write_file'
require './read_file'
require './data'
require './book'
require './person'

class Library
  attr_accessor :files, :data

  def initialize
    @files = @writer_file = WriteFile.new
    @data = Data.new
    begin
      ReadFile.new(@data).read_files
    rescue Errno::ENOENT
      puts 'No data file found.'
    end
  end

  def add_book(title, author)
    @files.books(title, author)
  end

  def get_book(title)
    @data.books.select do |book|
      return book if book.title == title
    end
  end

  def add_student(classroom, age, name, parent_permission)
    @files.persons_student('Student', classroom, age, name, parent_permission)
  end

  def get_student(name)
    @data.persons.select do |person|
      return person if person.name == name
    end
  end

  def add_teacher(specialization, age, name)
    @files.persons_teacher('Teacher', specialization, age, name)
  end

  def get_teacher(name)
    @data.persons.select do |person|
      return person if person.name == name
    end
  end

  def add_rental(date, book_number, person_number)
    @files.rentals(date, book_number, person_number)
  end

  # each_with_index { |book, index|
  def get_rental(book_number)
    @data.rentals.each_with_index do |rental, index|
      # puts rental.book
      return rental.book if index == book_number
    end
  end
end
