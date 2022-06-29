require 'json'

class Write_File
    def initialize()
     @persons_json = if File.exist?('person.json')
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

    def persons(classroom, age, name, permission)
        person_object = JSON.generate([classroom, age, name, permission])
        @persons_json.write("\n#{person_object}")

      #   "{\"title\": \"#{self.title}\", \"author\": \"#{self.author}\"}" 
    end
    
    def books(title, author)
        book_object = JSON.generate([title, author])
        @books_json.write("#{book_object}")
    end

    def rentals(date, book_number, person_number)
        rental_object = JSON.generate([date, book_number, person_number])
        @rentals_json.write("#{rental_object}")
    end

    def close_file
      @persons_json.close
      @books_json.close
      @rentals_json.close
    end

end