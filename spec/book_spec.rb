require_relative './../book'
require_relative './library'

describe 'Book Tests' do
    context 'Create Object' do
      it 'Book has the correct Info' do
        title='Mothering Heights'
        author='Dav Pilkey'
        book=Book.new(title, author)
        expect(book.title).to eq(title)
        expect(book.author).to eq(author)
      end
    end
    context 'Validate stored book' do
      library = Library.new  'books.json'
      it 'accepts new books' do
        title='Designing for the Web'
        author='Mark Boulton'
        library.add_book( title , author)
        library.get_book(title).should be_an_instance_of Book
    end
    end
end
  