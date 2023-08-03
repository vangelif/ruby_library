require_relative 'decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    capitalize_name(nameable.correct_name)
  end

  private

  def capitalize_name(name)
    name.split.map(&:capitalize).join(' ')
  end
end
