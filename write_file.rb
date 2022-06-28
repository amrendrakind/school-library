require 'json'

class Write_File
    def initialize()
     @person_json = if File.exist?('person.json')
                       File.open('person.json','a')
                    else
                       File.open('person.json','w')
                    end
     @books_json = if File.exist?('books.json')
                       File.open('books.json','a')
                    else
                       File.open('books.json','w')
                    end
     @rentals_json = if File.exist?('rentals.json')
                       File.open('rentals.json','a')
                    else 
                       File.open('rentals.json','w')
                    end
    end

    def books(title, author)
        book_object = [title, author]
        @books_json.write("#{book_object}")
    end
end