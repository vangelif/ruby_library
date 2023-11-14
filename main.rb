require_relative 'app'
require_relative 'modules/render'
require_relative 'modules/choice'

# STEP SEVEN: build Main class and include Render and Choice modules    
class Main

  # STEP SIX: build Render and Choice modules
  # check on the module folder 
  include Render
  include Choice

  # STEP EIGHT: build an instantation from the App class
  def initialize(input_source: $stdin)
    @app = App.new
    @input_source = input_source
  end

  # STEP NINE: build a run method ie. a loop to 
  # A. display choices and
  # B. handle input from the user
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
