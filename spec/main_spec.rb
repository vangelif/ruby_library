# spec/main_spec.rb

require_relative '../main'

RSpec.describe Main do
  let(:app) { instance_double('App') }
  let(:input_source) { StringIO.new }
  subject(:main) { described_class.new(input_source: input_source) }

  before do
    allow(App).to receive(:new).and_return(app)
  end

  describe '#run' do
    context 'when user enters 7' do
      it 'saves the app and displays a goodbye message' do
        allow(main).to receive(:render_choices)
        input_source.puts('7') # Provide test input
        input_source.rewind

        expect(app).to receive(:save)
        expect { main.run }.to output(/leaving/).to_stdout
      end
    end

    context 'when user enters a number other than 7' do
      it 'calls choose_a_number with the correct choice' do
        allow(main).to receive(:render_choices)
        input_source.puts('1', '7') # Provide test input
        input_source.rewind

        expect(main).to receive(:choose_a_number).with(app, 1)
        expect(app).to receive(:save)

        main.run
      end
    end
  end
end
