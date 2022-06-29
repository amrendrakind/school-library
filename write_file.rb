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
      
        person_object = JSON.generate('classroom' => classroom,'age' => age,'name' => name, 'parent_permission' => permission)
        @persons_json.write("#{person_object}\n")
   end
    
    def books(title, author)
        book_object = JSON.generate({'title' => title,'author' => author})
        @books_json.write("#{book_object}\n")
    end

    def rentals(date, book_number, person_number)
        rental_object = JSON.generate([date, book_number, person_number])
        @rentals_json.write("#{rental_object}\n")
         # "{\"date\": #{self.date}, \"person_id\": \"#{self.person._id}\", \"name\": \"#{self.person._name}\", \"book_id\": \"#{self.book.id}\",\"book_title\": \"#{self.book.title}\", \"book_author\": \"#{self.book.author}\"}"
    end

    def close_file
      @persons_json.close
      @books_json.close
      @rentals_json.close
    end

end