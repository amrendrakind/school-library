require 'json'

class WriteFile
  def initialize()
    @persons_json = if File.exist?('person.json')
                      File.open('person.json', 'a')
                    else
                      File.open('person.json', 'w')
                    end
    @books_json = if File.exist?('books.json')
                    File.open('books.json', 'a')
                  else
                    File.open('books.json', 'w')
                  end
    @rentals_json = if File.exist?('rentals.json')
                      File.open('rentals.json', 'a')
                    else
                      File.open('rentals.json', 'w')
                    end
  end

  def persons_student(type, classroom, age, name, permission)
    student_object = JSON.generate('type' => type, 'classroom' => classroom, 'age' => age, 'name' => name,
                                   'parent_permission' => permission)
    @persons_json.write("#{student_object}\n")
  end

  def persons_teacher(type, specialization, age, name)
    teacher_object = JSON.generate('type' => type, 'specialization' => specialization, 'age' => age, 'name' => name)
    @persons_json.write("#{teacher_object}\n")
  end

  def books(title, author)
    book_object = JSON.generate({ 'title' => title, 'author' => author })
    @books_json.write("#{book_object}\n")
  end

  def rentals(date, book_number, person_number)
    rental_object = JSON.generate('date' => date, 'book_number' => book_number, 'person_number' => person_number)
    @rentals_json.write("#{rental_object}\n")
  end

  def close_file
    @persons_json.close
    @books_json.close
    @rentals_json.close
  end
end
