require_relative '../book'
require 'json'
require 'date'

describe Book do
  it 'takes two parameters and returns the Book object' do
    book = Book.new(title: 'title one', author: 'an author')
    expect(book).to be_an_instance_of Book
  end

  it 'title book equals to title one' do
    book = Book.new(title: 'title one', author: 'an author')
    expect(book.title).to eql 'title one'
  end

  it 'author equals to an author' do
    book = Book.new(title: 'title one', author: 'an author')
    expect(book.author).to eql 'an author'
  end

  it 'checks rentals to be an empty array' do
    book = Book.new(title: 'title one', author: 'an author')
    expect(book.rentals).to eql []
  end

  it 'checks id is an integer' do
    book = Book.new(title: 'title one', author: 'an author')
    expect(book.id.class).to be Integer
  end

  it 'takes three parameters and returns the Book object' do
    book = Book.new(title: 'title two', author: 'author two', id: 47)

    expect(book).to be_an_instance_of Book
  end

  it 'title book equals to title two' do
    book = Book.new(title: 'title two', author: 'author two', id: 47)

    expect(book.title).to eql 'title two'
  end

  it 'author equals to author two' do
    book = Book.new(title: 'title two', author: 'author two', id: 47)

    expect(book.author).to eql 'author two'
  end

  it 'checks rentals to be an empty array' do
    book = Book.new(title: 'title two', author: 'author two', id: 47)

    expect(book.rentals).to eql []
  end

  it 'checks id is an integer' do
    book = Book.new(title: 'title two', author: 'author two', id: 47)
    expect(book.id.class).to be Integer
  end

  it 'checks id is equal to 47' do
    book = Book.new(title: 'title two', author: 'author two', id: 47)
    expect(book.id).to eql 47
  end
  # additions
  let(:book_title) { 'Test Book' }
  let(:book_author) { 'Test Author' }
  let(:book_id) { 123 }
  # Helper method to create a new book instance for each test
  def new_book
    Book.new(title: book_title, author: book_author, id: book_id)
  end

  describe '#add_rental' do
    it 'adds a new rental to the rentals array' do
      book = new_book
      rental_date = Date.today

      person = Person.new(name: 'John Doe', age: 25) # Create a Person instance
      book.add_rental(rental_date, person) # Pass the person instance as the second argument

      expect(book.rentals).not_to be_empty
      expect(book.rentals.size).to eq(1)
      expect(book.rentals.first.date).to eq(rental_date)
      expect(book.rentals.first.book).to eq(book)
      expect(book.rentals.first.person).to eq(person)
    end
  end

  describe '#to_json' do
    it 'returns a valid JSON representation of the book' do
      book = new_book
      expected_json = {
        id: book_id,
        title: book_title,
        author: book_author
      }.to_json

      expect(book.to_json).to eq(expected_json)
    end
  end
  describe '#to_s' do
    it 'returns a formatted string representation of the book' do
      book = new_book
      expected_string = "📚 Title: #{book_title} by #{book_author}"

      expect(book.to_s).to eq(expected_string)
    end
  end
end
