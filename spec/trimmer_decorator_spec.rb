require_relative '../teacher'
require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  describe 'creates an instance of TrimmerDecorator' do
    it 'returns a TrimmerDecorator object' do
      teacher = Teacher.new(name: 'mr. schwarzenegger', age: 30, specialization: 'sports')
      trimmer_decorator = TrimmerDecorator.new(teacher)
      expect(trimmer_decorator).to be_an_instance_of TrimmerDecorator
    end
  end

  describe 'the TrimmerDecorator instance works' do
    it 'correct_name returns the trimmed name' do
      teacher = Teacher.new(name: 'mr. schwarzenegger', age: 30, specialization: 'sports')
      trimmer_decorator = TrimmerDecorator.new(teacher)
      expect(trimmer_decorator.correct_name).to eq('mr. schwar')
    end
  end
end
