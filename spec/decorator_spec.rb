require_relative '../nameable'
require_relative '../decorator'

class MockNameable < Nameable
  def correct_name
    'Name'
  end
end

describe Decorator do
  describe 'creates an instance of Decorator' do
    it 'returns a Decorator object' do
      nameable = Nameable.new
      decorator = Decorator.new(nameable)
      expect(decorator).to be_an_instance_of Decorator
    end
  end

  describe 'the Decorator instance returns valid values' do
    it 'correct_name returns the right value' do
      nameable = MockNameable.new
      decorator = Decorator.new(nameable)
      expect(decorator.correct_name).to eq('Name')
    end

    it 'the nameable object is accesible' do
      nameable = MockNameable.new
      decorator = Decorator.new(nameable)
      expect(decorator.nameable).to eq(nameable)
    end
  end
end
