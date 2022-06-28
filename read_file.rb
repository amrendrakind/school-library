require 'json'
class Read_File
    def initialize(data)
     @person_json = File.open("person.json", "r")
     @books_json = File.open("books.json", "r")
     @rentals_json = File.open("rentals.json", "r")
    end

    def read_file
        @person_json.each{|line| @person << JSON.parse(line)}
        @person_json.close
        @books_json.each{|line| @pbook << JSON.parse(line)}
        @books_json.close   
        @rentals_json.each{|line| @rental << JSON.parse(line)}
        @rentals_json.close
    end
end