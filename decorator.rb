require_relative 'nameable'

# Class acting as base decorator
class BaseDecorator < Nameable
  attr_accessor :nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
