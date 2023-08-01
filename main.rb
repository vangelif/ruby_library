require_relative 'app'
require_relative 'modules/render'
require_relative 'modules/choice'

class Main
  include Render
  include Choice

  def initialize
    @app = App.new
  end

  def run
    loop do
      render_choices
      choice = gets.chomp.to_i
      break if choice == 7

      choose_a_number(@app, choice)
    end

    puts '👋 Sorry to see you leaving..'
  end
end

main = Main.new
main.run
