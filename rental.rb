require 'json'
require_relative 'book'
require_relative 'person'

# STEP THREE: build Rental class with  
# its attributes: `date`, `book`, `person`

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    person.rentals << self
    book.rentals << self
  end

  def to_s
    "Date: #{@date}, #{@book} 🤝"
  end

  def to_json(*_args)
    JSON.dump({
                date: @date,
                book_id: @book.id,
                person_id: @person.id
              })
  end

  # self.from_json is a class method
  #   - string is rental in JSON format
  #   - books is the array of books in the App
  #   - persons is the array of persons in the App
  def self.from_json(string, books, persons)
    # when we parse the rental (string)
    data = JSON.parse string
    # we extract the book_id that it is a number
    book_id = data['book_id']
    # then we extract the person_id that it is a number too
    person_id = data['person_id']

    # then we search for the book(object) with the id of book_id
    #  - this is done with the class method self.select in Book class
    book = Book.select(book_id, books)
    # then we search for the person(object) with the id of person_id
    #  - this is done with the class method self.select in Person class
    person = Person.select(person_id, persons)

    # once we have a book object and a person object
    # we can proceed to create the rental
    new(data['date'], book, person)
  end
end
