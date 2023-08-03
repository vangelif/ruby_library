require_relative '../capitalize_decorator'
require_relative '../decorator'

RSpec.describe CapitalizeDecorator do
  describe '#correct_name' do
    let(:nameable_mock) { double('nameable') }
    subject { CapitalizeDecorator.new(nameable_mock) }

    it 'delegates correct_name to the nameable object and capitalizes the result' do
      allow(nameable_mock).to receive(:correct_name).and_return('john doe')
      expect(subject.correct_name).to eq('John Doe')
    end

    it 'capitalizes correctly when the nameable object returns an already capitalized name' do
      allow(nameable_mock).to receive(:correct_name).and_return('John Doe')
      expect(subject.correct_name).to eq('John Doe')
    end

    it 'capitalizes correctly when the nameable object returns an all-uppercase name' do
      allow(nameable_mock).to receive(:correct_name).and_return('JOHN DOE')
      expect(subject.correct_name).to eq('John Doe')
    end

    it 'capitalizes correctly when the nameable object returns a mix of uppercase and lowercase' do
      allow(nameable_mock).to receive(:correct_name).and_return('jOhN dOe')
      expect(subject.correct_name).to eq('John Doe')
    end
  end
end
