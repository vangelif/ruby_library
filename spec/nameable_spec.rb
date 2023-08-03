require_relative '../nameable'

describe Nameable do
  it 'raises NotImplementedError' do
    nameable = Nameable.new
    expect do
      nameable.correct_name
    end.to raise_error(NotImplementedError, 'Nameable has not implemented method correct_name')
  end

  it 'raises NotImplementedError with a custom message' do
    nameable = Nameable.new
    expect { nameable.correct_name }.to raise_error(/Nameable has not implemented method correct_name/)
  end
end
