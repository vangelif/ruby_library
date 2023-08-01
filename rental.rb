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
end
