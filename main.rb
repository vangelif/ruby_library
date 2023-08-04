require_relative 'app'
require_relative 'modules/render'
require_relative 'modules/choice'

class Main
  include Render
  include Choice

  def initialize(input_source: $stdin)
    @app = App.new
    @input_source = input_source
  end

  def run
    loop do
      render_choices
      choice = @input_source.gets.chomp.to_i
      break if choice == 7

      choose_a_number(@app, choice)
    end

    @app.save
    puts '👋 Sorry to see you leaving..'
  end
end

main = Main.new
main.run
