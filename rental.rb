require 'json'

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
                date: @date
              })
  end

  def self.from_json(string)
    data = JSON.load string
    self.new(data['date'])
  end
end
