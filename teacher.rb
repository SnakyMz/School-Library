# frozen_string_literal: true

require_relative 'person'

# Class of Teacher inherited from Person
class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
