require_relative '../student'

describe Student do
  describe 'creates the Student John with an age of 14 (two params)' do
    it 'the result is an instance of Student class' do
      student = Student.new(name: 'John', age: 14)
      expect(student).to be_an_instance_of Student
    end

    it 'the name attribute for the student is "John"' do
      student = Student.new(name: 'John', age: 14)
      expect(student.name).to eql 'John'
    end

    it 'the age attribute for the student is 14' do
      student = Student.new(name: 'John', age: 14)
      expect(student.age).to eql 14
    end

    it 'the parent_permission attribute for the student is true' do
      student = Student.new(name: 'John', age: 14)
      expect(student.can_use_services?).to be_truthy
    end

    it 'the id attribute for the student is an Integer' do
      student = Student.new(name: 'John', age: 14)
      expect(student.id).to be_an_instance_of Integer
    end
  end

  describe 'creates the Student Carlos, age 17, no parent\'s permission (three params)' do
    it 'the result is an instance of Student class' do
      student = Student.new(name: 'Carlos', age: 17, parent_permission: false)
      expect(student).to be_an_instance_of Student
    end

    it 'the name attribute for the student is "Carlos"' do
      student = Student.new(name: 'Carlos', age: 17, parent_permission: false)
      expect(student.name).to eql 'Carlos'
    end

    it 'the age attribute for the student is 17' do
      student = Student.new(name: 'Carlos', age: 17, parent_permission: false)
      expect(student.age).to eql 17
    end

    it 'the parent_permission attribute for the student is false' do
      student = Student.new(name: 'Carlos', age: 17, parent_permission: false)
      expect(student.can_use_services?).to be_falsy
    end

    it 'the id attribute for the student is an Integer' do
      student = Student.new(name: 'Carlos', age: 17, parent_permission: false)
      expect(student.id).to be_an_instance_of Integer
    end
  end

  describe 'creates the Student "Javier", age 12, no parent\'s permission and id of 1298 (four params)' do
    it 'the result is an instance of Student class' do
      student = Student.new(name: 'Javier', age: 12, parent_permission: false, id: 1298)
      expect(student).to be_an_instance_of Student
    end

    it 'the name attribute for the student is "Javier"' do
      student = Student.new(name: 'Javier', age: 12, parent_permission: false, id: 1298)
      expect(student.name).to eql 'Javier'
    end

    it 'the age attribute for the student is 12' do
      student = Student.new(name: 'Javier', age: 12, parent_permission: false, id: 1298)
      expect(student.age).to eql 12
    end

    it 'the parent_permission attribute for the student is false' do
      student = Student.new(name: 'Javier', age: 12, parent_permission: false, id: 1298)
      expect(student.can_use_services?).to be_falsy
    end

    it 'the id attribute for the student is an Integer' do
      student = Student.new(name: 'Javier', age: 12, parent_permission: false, id: 1298)
      expect(student.id).to be_an_instance_of Integer
    end

    it 'the id attribute for the student is 1298' do
      student = Student.new(name: 'Javier', age: 12, parent_permission: false, id: 1298)
      expect(student.id).to eql 1298
    end
  end

  describe 'a Student is displayed correctly' do
    it '\'to_s\' method returns a custom string to display a Student' do
      student = Student.new(name: 'Javier', age: 12, parent_permission: false, id: 1293)
      expect(student.to_s).to eql('[Student 🧍], ID: 1293, Name: Javier, age: 12, has parent\'s permission?: no')
    end
  end
end
