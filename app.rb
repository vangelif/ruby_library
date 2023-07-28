require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'rental'
require_relative 'classroom'
require_relative 'teacher'

class App
  attr_accessor :books, :persons, :classroom, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  # List all books.
  def list_books
    puts 'List of Books:'
    @books.each do |book|
      puts "📚 #{book[:title]} by #{book[:author]}"
    end
  end

  # List all people.
  def list_people
    @persons.each do |person|
      if person.instance_of?(Student)
        puts "[Student 🧍], ID: #{person.id}, Name: #{person.name}, age: #{person.age}"
      else
        puts "[Teacher 👨‍🏫], ID: #{person.id}, Name: #{person.name}, age: #{person.age}"
      end
    end
  end

  # Create a person (teacher or student)
  def create_a_person
    puts 'Do you want to add a student (1) or a teacher (2)? [Insert the number]'
    is_student = gets.chomp.to_i
    puts 'Age'
    age = gets.chomp.to_i
    puts 'Name'
    person_name = gets.chomp

    case is_student
    when 1
      puts 'Has parent permission? [Y/N]'
      parent_permission = gets.chomp.downcase == 'y'
      student = Student.new(age, parent_permission, person_name)
      @persons.push(student)
    when 2
      puts 'Specialization'
      specialization = gets.chomp
      teacher = Teacher.new(age, specialization, person_name)
      @persons.push(teacher)
    end
    puts '🎉 Person added successfully.'
  end
end

# Create a book
def create_a_book
  puts 'Title'
  book_title = gets.chomp
  puts 'Author'
  book_author = gets.chomp
  book = Book.new(book_title, book_author)
  @books.push(book)
  puts '🎉 Book added successfully.'
end

# Create a rental
def create_a_rental
  puts 'Select a book from the following list by number'
  @books.each_with_index do |book, index|
    puts "#{index}) Title: #{book.title}, Author: #{book.author}"
  end
  book_index = gets.chomp.to_i
  puts 'Select a person from the following list by number (not ID)'
  @persons.each_with_index do |person, index|
    puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
  person_index = gets.chomp.to_i
  puts 'Date'
  date = gets.chomp
  rental = Rental.new(date, @book[book_index], @persons[person_index])
  @rentals.push(rental)
  puts '🔑 Rental added successfully'
end

# List all rentals for a given person id.
def list_rentals
  puts 'ID of person'
  input_person_id = gets.chomp
  puts 'Rentals'
  @rentals.each do |rental|
    if rental.person.id == input_person_id
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author} 🤝"
    end
  end
end
