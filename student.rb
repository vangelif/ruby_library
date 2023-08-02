require 'json'

class Student < Person
  attr_accessor :classroom

  def initialize(name:, age:, parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    @classroom = classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_s
    permission = @parent_permission ? 'yes' : 'no'
    "[Student 🧍], ID: #{@id}, Name: #{@name}, age: #{@age}, has parent's permission?: #{permission}"
  end

  def to_json(*_args)
    JSON.dump({
                type: self.class,
                id: @id,
                name: @name,
                age: @age,
                parent_permission: @parent_permission
              })
  end
  def self.from_json(string)
    data = JSON.load string
    self.new(data['name'], data['age'], data['parent_permission'])
  end
end
