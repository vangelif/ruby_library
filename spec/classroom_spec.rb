require_relative '../classroom'

describe Classroom do
  let(:classroom_label) { 'Ruby & RSpec' }
  let(:classroom) { Classroom.new(classroom_label) }

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
