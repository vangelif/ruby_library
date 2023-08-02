require_relative '../classroom'
require_relative '../student'
require 'json'

describe Classroom do
  let(:classroom_label) { 'Ruby & RSpec' }
  let(:classroom) { Classroom.new(classroom_label) }

  describe '#add_student' do
    it "should add a student to the classroom's students list" do
      classroom = Classroom.new('Math')
      student = Student.new(name: 'Vangelis', age: 15)

      classroom.add_student(student)

      expect(classroom.students).to include(student)
    end

    it 'should set the classroom of the student to the current classroom' do
      classroom = Classroom.new('Math')
      student = Student.new(name: 'Vangelis', age: 15)

      classroom.add_student(student)

      expect(student.classroom).to eq(classroom)
    end
  end

  # context '#add_student' do
  #   it 'should add a student to the classroom' do
  #     student_name = 'John Doe'
  #     student = double('Student', name: student_name)

  #     expect {
  #       classroom.add_student(student)
  #     }.to change { classroom.students.length }.by(1)

  #     expect(classroom.students).to include(student)
  #     expect(student.classroom).to eq(classroom)
  #   end
  # end

  it 'creates a new Classroom object with the given label' do
    expect(classroom.label).to eq(classroom_label)
  end

  it 'initializes students as an empty array' do
    expect(classroom.students).to be_an(Array)
    expect(classroom.students).to be_empty
  end

  it 'returns the correct label' do
    expect(classroom.label).to eq(classroom_label)
  end

  it 'returns the students array' do
    expect(classroom.students).to be_an(Array)
  end

  it 'sets the students array with the provided value' do
    students = %w[Luiz Vangelis Marina]
    classroom.students = students
    expect(classroom.students).to eq(students)
  end
end
