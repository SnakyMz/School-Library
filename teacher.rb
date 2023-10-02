require_relative 'person'

class Teacher < Person
  def initialize(specialization, name = "Unknown", age, parent_permission: true)
    super(name, age, parent_permission)
    @specialization = specialization
  end
end