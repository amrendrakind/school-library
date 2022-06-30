require './write_file'
require './read_file'
class Library
    attr_accessor :books
 
    def initialize lib_file = false
        @lib_file = lib_file
        @books = @writer_file = WriteFile.new
     end
 
    def add_book book
        @books.push book
    end
 
    def get_book title
        @books.select do |book|
            book.title == title
        end.first
    end
 
    def save lib_file = false
        
    end
end