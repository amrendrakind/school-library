require 'json'
require './book'
require './teacher'
require './student'
require './rental'

class Read_File
    def initialize(data)
     @person_json = File.open("person.json", "r")
     @books_json = File.open("books.json", "r")
     @rentals_json = File.open("rentals.json", "r")
     @data = data
     @persons = []
     @books = []
     @rentals = []
    end

    def read_files
        @person_json.each{|line| @persons << JSON.parse(line)}
        @person_json.close
        create_person
        @books_json.each{|line| @books << JSON.parse(line)}
        @books_json.close
        create_books
        @rentals_json.each{|line| @rentals << JSON.parse(line)}
        @rentals_json.close
        create_rentals
    end

    def create_person
        @persons.each do |person|
            if person.class == 'Teacher'
                @data.persons << Teacher.new(person[0], person[1], person[2])
            else
                @data.persons << Student.new(person['classroom'], person['age'], person['name'], person['parent_permission'])
            end
        end
    end

    def create_books
        @books.each do |book|
            @data.books << Book.new(book['title'], book['author'])
        end
    end

    def create_rentals

    end
end