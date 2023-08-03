require_relative '../book'

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
end
