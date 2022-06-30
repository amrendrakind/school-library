require_relative './../book'

describe 'Book Tests' do
    context 'Create' do
      it 'Book has the correct Info' do
        title='Mothering Heights'
        author='Dav Pilkey'
        book=Book.new(title, author)
        expect(book.title).to eq(title)
        expect(book.author).to eq(author)
      end
    end
end
  