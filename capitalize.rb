# frozen_string_literal: true

require_relative 'decorator'

# Class containing method to capitalize name
class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
