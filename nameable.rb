# frozen_string_literal: true

# Class containing correct_name method
class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
