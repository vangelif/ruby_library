require 'json'
require_relative 'rental'
require_relative 'person'


class Book
  attr_accessor :id, :title, :author, :rentals

  def initialize(title:, author:, id: nil)
    @id = id.nil? ? Random.rand(100..10_000) : id
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end

  def to_s
    "📚 Title: #{@title} by #{@author}"
  end

  def to_json(*_args)
    JSON.dump({
                id: @id,
                title: @title,
                author: @author
              })
  end

  def self.from_json(string)
    data = JSON.parse string
    new(id: data['id'], title: data['title'], author: data['author'])
  end

  # self.select is a class method
  #   it receives an id and an array of books
  def self.select(book_id, books)
    # books.select will do the following
    #   - search for a book with id of book_id
    #   - in case a book with that id exists
    #      - it will be returned using the .first method
    books.select { |book| book.id == book_id }.first
  end
end
