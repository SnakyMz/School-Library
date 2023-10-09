# frozen_string_literal: true

require_relative 'nameable'

# Class acting as base decorator
class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
