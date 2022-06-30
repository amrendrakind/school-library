require './write_file'
require './read_file'
require './data'
class Library
    attr_accessor :files, :data
 
    def initialize lib_file = false
        @lib_file = lib_file
        @files = @writer_file = WriteFile.new
        @data = Data.new
        begin
          ReadFile.new(@data).read_files
        rescue Errno::ENOENT
          puts 'No data file found.'
        end
     end
 
    def add_book (title, author)
        @files.books(title, author)
    end
 
    def get_book title
        @data.books.select do |book|
            return book if book.title == title
        end
    end
 
    def save lib_file = false
        
    end
end