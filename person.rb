# STEP ONE: build Nameable module with its correct_name method
# STEP TWO: build Person class with its attributes and methods
require_relative 'nameable'

class Person < Nameable
  attr_accessor :id, :name, :age, :rentals

  def initialize(name:, age:, id: nil, parent_permission: true)
    super()
    @id = id.nil? ? Random.rand(100..10_000) : id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  # self.select is a class method
  #   it receives an id and an array of persons
  def self.select(person_id, persons)
    # persons.select will do the following
    #   - search for a person with id of person_id
    #   - in case a person with that id exists
    #      - it will be returned using the .first method
    persons.select { |person| person.id == person_id }.first
  end

  private

  def of_age?
    @age && @age >= 18
  end
end
