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
end
