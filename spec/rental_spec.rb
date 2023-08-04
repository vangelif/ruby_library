require_relative '../rental'
require_relative '../teacher'
require_relative '../book'

describe Rental do
  describe 'creates a Rental instance' do
    it 'the result is an instance of Rental class' do
      person = Teacher.new(name: 'Mr. Smith', age: 35, specialization: 'Chemistry')
      book = Book.new(title: 'Chemistry for newbies', author: 'The teacher')
      rental = Rental.new('2023-08-02', book, person)
      expect(rental).to be_an_instance_of Rental
    end

    it 'the date attribute for the rental is "2023-08-02"' do
      person = Teacher.new(name: 'Mr. Smith', age: 35, specialization: 'Chemistry')
      book = Book.new(title: 'Chemistry for newbies', author: 'The teacher')
      rental = Rental.new('2023-08-02', book, person)
      expect(rental.date).to eql '2023-08-02'
    end

    it 'the book attribute for the rental is an instance of Book' do
      person = Teacher.new(name: 'Mr. Smith', age: 35, specialization: 'Chemistry')
      book = Book.new(title: 'Chemistry for newbies', author: 'The teacher')
      rental = Rental.new('2023-08-02', book, person)
      expect(rental.book).to be_an_instance_of Book
    end

    it 'the person attribute for the rental is an instance of Teacher' do
      person = Teacher.new(name: 'Mr. Smith', age: 35, specialization: 'Chemistry')
      book = Book.new(title: 'Chemistry for newbies', author: 'The teacher')
      rental = Rental.new('2023-08-02', book, person)
      expect(rental.person).to be_an_instance_of Teacher
    end
  end

  describe 'to the book rented' do
    it 'the created rental is added' do
      person = Teacher.new(name: 'Mr. Smith', age: 35, specialization: 'Chemistry')
      book = Book.new(title: 'Chemistry for newbies', author: 'The teacher')
      rental = Rental.new('2023-08-02', book, person)
      expect(book.rentals).to include rental
    end
  end

  describe 'to the person who makes the rent' do
    it 'the created rental is added' do
      person = Teacher.new(name: 'Mr. Smith', age: 35, specialization: 'Chemistry')
      book = Book.new(title: 'Chemistry for newbies', author: 'The teacher')
      rental = Rental.new('2023-08-02', book, person)
      expect(person.rentals).to include rental
    end
  end

  describe 'a Rental is displayed correctly' do
    it '\'to_s\' method returns a custom string to display a rental' do
      person = Teacher.new(name: 'Mr. Smith', age: 35, specialization: 'Chemistry')
      book = Book.new(title: 'Chemistry for newbies', author: 'The teacher')
      rental = Rental.new('2023-08-02', book, person)
      expect(rental.to_s).to eql('Date: 2023-08-02, 📚 Title: Chemistry for newbies by The teacher 🤝')
    end
  end

  describe 'a Rental is converted to JSON for saving it to \'rentals.json\' file' do
    it '\'to_json\' method returns JSON hash object ready to write it to \'rentals.json\' file' do
      person = Teacher.new(name: 'Mr. Smith', age: 35, specialization: 'Chemistry', id: 1313)
      book = Book.new(title: 'Chemistry for newbies', author: 'The teacher', id: 1020)
      rental = Rental.new('2023-08-02', book, person)
      expect(rental.to_json).to be_an_instance_of String
      expect(JSON.parse(rental.to_json)).to be_an_instance_of Hash
    end

    it '\'to_json\' returned value can be parsed to a Hash' do
      person = Teacher.new(name: 'Mr. Smith', age: 35, specialization: 'Chemistry', id: 1313)
      book = Book.new(title: 'Chemistry for newbies', author: 'The teacher', id: 1020)
      rental = Rental.new('2023-08-02', book, person)
      expect(JSON.parse(rental.to_json)).to be_an_instance_of Hash
    end

    it '\'to_json\' method returns a valid Rental JSON string' do
      person = Teacher.new(name: 'Mr. Smith', age: 35, specialization: 'Chemistry', id: 1313)
      book = Book.new(title: 'Chemistry for newbies', author: 'The teacher', id: 1020)
      rental = Rental.new('2023-08-02', book, person)
      rental_hash = { date: '2023-08-02', book_id: 1020, person_id: 1313 }
      expect(JSON.parse(rental.to_json)).to eql(JSON.parse(JSON.dump(rental_hash)))
    end
  end
end
