require_relative '../person'

describe Person do
  before(:each) do
    @person = Person.new(name: 'John Doe', age: 25)
  end

  # Test 1: Check if the person's age is set correctly
  it 'has the correct age' do
    expect(@person.age).to eq(25)
  end

  # Test 2: Check if the person can use services when of age
  it 'can use services when of age' do
    expect(@person.can_use_services?).to be(true)
  end

  # Test 3: Check if the person can use services with parent's permission
  it 'can use services with parent permission' do
    person_with_permission = Person.new(name: 'Jane Doe', age: 17, parent_permission: true)
    expect(person_with_permission.can_use_services?).to be(true)
  end

  # Test 4: Check if the person cannot use services without parent's permission
  it 'cannot use services without parent permission' do
    person_without_permission = Person.new(name: 'Bob Smith', age: 15, parent_permission: false)
    expect(person_without_permission.can_use_services?).to be(false)
  end

  # Test 5: Check if a new person has a random ID within the specified range
  it 'has a random ID within the specified range' do
    expect(@person.id).to be >= 100
    expect(@person.id).to be <= 10_000
  end

  # Test 6: Check if a person's name is set correctly
  it 'has the correct name' do
    expect(@person.name).to eq('John Doe')
  end

  # Test 7: Check if a new person has an empty rentals array
  it 'has an empty rentals array' do
    expect(@person.rentals).to be_empty
  end

  # Test 8: Check if the correct name method returns the name
  it 'returns the correct name' do
    expect(@person.correct_name).to eq('John Doe')
  end

  # Test 9: Check if the self.select method returns the correct person
  it 'returns the correct person using self.select' do
    persons = [
      Person.new(name: 'Alice', age: 20, id: 123),
      Person.new(name: 'Bob', age: 22, id: 456),
      Person.new(name: 'Charlie', age: 18, id: 789)
    ]

    selected_person = Person.select(456, persons)
    expect(selected_person.name).to eq('Bob')
    expect(selected_person.age).to eq(22)
  end
end
