class Teacher < Person
  attr_accessor :specialization

  def initialize(name:, age:, specialization:)
    super(name: name, age: age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_s
    "[Teacher 👨‍🏫], ID: #{@id}, Name: #{@name}, age: #{@age}, specialization: #{@specialization}"
  end
end
