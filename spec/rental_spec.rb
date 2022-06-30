require_relative './../rental'
require_relative './../book'
require_relative './../teacher'
require_relative './library'

describe 'Rental Tests' do
    context 'Create Object' do
      it 'Rental has the correct Info' do
        date = '30 June 2022'
        title = 'Mothering Heights'
        author = 'Dav Pilkey'
        specialization = 'Atronomy'
        name = 'Mark R. Levin'
        age = 30
        book=Book.new(title, author)
        person=Teacher.new(specialization, name, age)
        rental=Rental.new(date, book, person)
        expect(rental.book).to eq(book)
        expect(rental.person).to eq(person)
      end
    end
    context 'Validate stored rental' do
      library = Library.new
      it 'accepts new rental' do
        title = 'Designing for the Web'
        date = '30 June 2022'
        book_number = 3
        person_number = 2
        library.add_rental( date, book_number, person_number)
        getrental = library.get_rental(book_number)
        expect(getrental.title).to eq(title)
    end
    end
end