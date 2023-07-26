require 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    trimmed = super
    if trimmed.length > 10
      trimmed[0..9]
    else
      trimmed
    end
  end
end
