require_relative '../teacher'

describe Teacher do
  let(:name) { 'Vangelis' }
  let(:age) { 35 }
  let(:specialization) { 'Ruby' }
  let(:id) { 1 }

  it 'creates a teacher object with name, age, and specialization' do
    teacher = Teacher.new(name: name, age: age, specialization: specialization)
    expect(teacher.name).to eq(name)
    expect(teacher.age).to eq(age)
    expect(teacher.specialization).to eq(specialization)
  end
  it 'id not nil if an specific id is not provided' do
    teacher = Teacher.new(name: name, age: age, specialization: specialization)
    expect(teacher.id).not_to be_nil
  end
  it 'id is set to an integer if an specific id is not provided' do
    teacher = Teacher.new(name: name, age: age, specialization: specialization)
    expect(teacher.id).to be_an_instance_of Integer
  end
  it 'creates a teacher object with the provided id, name, age, and specialization' do
    teacher = Teacher.new(id: id, name: name, age: age, specialization: specialization)
    expect(teacher.id).to eq(id)
    expect(teacher.name).to eq(name)
    expect(teacher.age).to eq(age)
    expect(teacher.specialization).to eq(specialization)
  end
  it 'inherits the Person properties' do
    teacher = Teacher.new(name: name, age: age, specialization: specialization)
    expect(teacher.respond_to?(:can_use_services?)).to be_truthy
  end
  it 'raises an ArgumentError if name is not provided' do
    expect { Teacher.new(age: age, specialization: specialization) }.to raise_error(ArgumentError)
  end
  it 'raises an ArgumentError if age is not provided' do
    expect { Teacher.new(name: name, specialization: specialization) }.to raise_error(ArgumentError)
  end
  it 'raises an ArgumentError if specialization is not provided' do
    expect { Teacher.new(name: name, age: age) }.to raise_error(ArgumentError)
  end

  it 'correctly formats the teacher information when converted to string' do
    teacher = Teacher.new(id: id, name: name, age: age, specialization: specialization)
    expect(teacher.to_s).to eq("[Teacher 👨‍🏫], ID: #{id}, " \
                               "Name: #{name}, age: #{age}, " \
                               "specialization: #{specialization}")
  end

  it 'correctly converts the teacher object to JSON' do
    teacher = Teacher.new(id: id, name: name, age: age, specialization: specialization)
    json_string = teacher.to_json
    expect(json_string).to be_a(String)

    # Check if the JSON string can be parsed back to a teacher object without errors
    parsed_teacher = JSON.parse(json_string)
    expect(parsed_teacher['type']).to eq(Teacher.to_s)
    expect(parsed_teacher['id']).to eq(id)
    expect(parsed_teacher['name']).to eq(name)
    expect(parsed_teacher['age']).to eq(age)
    expect(parsed_teacher['specialization']).to eq(specialization)
  end

  it 'correctly creates a teacher object from a JSON string' do
    teacher = Teacher.new(id: id, name: name, age: age, specialization: specialization)
    json_string = teacher.to_json
    parsed_teacher = Teacher.from_json(json_string)
    expect(parsed_teacher).to be_a(Teacher)
    expect(parsed_teacher.id).to eq(id)
    expect(parsed_teacher.name).to eq(name)
    expect(parsed_teacher.age).to eq(age)
    expect(parsed_teacher.specialization).to eq(specialization)
  end
end
