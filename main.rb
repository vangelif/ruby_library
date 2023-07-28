require_relative 'app'

def render_choices
  puts 'Choose your Option:'
  puts '1. List all books.'
  puts '2. List all people.'
  puts '3. Create a person.'
  puts '4. Create a book.'
  puts '5. Create a rental.'
  puts '6. List all rentals for a given person id.'
  puts '7. Quit'
end

def choose_a_number(choice, app)
  case choice
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_a_person
  when 4
    app.create_a_book
  when 5
    app.create_a_rental
  when 6
    app.list_rentals
  else
    puts '👋 Sorry to see you leaving..'
  end
end

def main
  app = App.new
  loop do
    render_choices
    choice = gets.chomp.to_i
    break if choice == 7

    choose_a_number(choice, app)
  end
end

main
