require 'nameable'

class Person < Nameable
  attr_accessor :id, :name, :age

  def initialize(name = 'Unknown', age = nil, parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    name
  end

  private

  def of_age?
    @age && @age >= 18
  end
end
