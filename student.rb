class Student < Person
  attr_accessor :classroom

  def initialize(name = 'Unknown', age = nil, classroom:, parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
