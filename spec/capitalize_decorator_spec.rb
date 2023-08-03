require_relative 'capitalize_decorator.rb'

describe CapitalizeDecorator do
    let(:decorated_object) { double('decorated_object', correct_name: 'john doe') }
    subject(:decorator) { described_class.new(decorated_object) }
  
    describe '#correct_name' do
      it 'returns the correct name with the first letter capitalized' do
        expect(decorator.correct_name).to eq('John doe')
      end
  
      it 'calls the correct_name method on the decorated object' do
        expect(decorated_object).to receive(:correct_name).and_return('john doe')
        decorator.correct_name
      end
    end
end