require_relative 'app'
require_relative 'modules/render'

class Main
  include Render
  def initialize
    @app = App.new
  end

  def choose_a_number(choice)
    case choice
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_a_person
    when 4
      @app.create_a_book
    when 5
      @app.create_a_rental
    when 6
      @app.list_rentals
    else
      puts '👋 Sorry to see you leaving..'
    end
  end

  def run
    loop do
      render_choices
      choice = gets.chomp.to_i
      break if choice == 7

      choose_a_number(choice)
    end
  end
end

main = Main.new
main.run
