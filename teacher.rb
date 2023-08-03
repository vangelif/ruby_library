require 'json'

class Teacher < Person
  attr_accessor :specialization

  def initialize(name:, age:, specialization:, id: nil)
    super(id: id, name: name, age: age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_s
    "[Teacher 👨‍🏫], ID: #{@id}, Name: #{@name}, age: #{@age}, specialization: #{@specialization}"
  end

  def to_json(*_args)
    JSON.dump({
                type: self.class,
                id: @id,
                name: @name,
                age: @age,
                specialization: @specialization
              })
  end

  def self.from_json(string)
    data = JSON.parse string
    new(id: data['id'], name: data['name'], age: data['age'], specialization: data['specialization'])
  end
end
