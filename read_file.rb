require 'json'
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

    def read_file
        @person_json.each{|line| @persons << JSON.parse(line)}
        @person_json.close
        read_person
        @books_json.each{|line| @books << JSON.parse(line)}
        @books_json.close
        @rentals_json.each{|line| @rentals << JSON.parse(line)}
        @rentals_json.close
    end

    def read_person
        puts 'List of all people'
        @persons.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
        puts ''
    end
end