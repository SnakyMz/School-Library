require_relative 'person'

# Class of Teacher inherited from Person
class Teacher < Person
  attr_accessor :specialization
  def initialize(specialization, age, name = 'Unknown', id = Random.rand(1..1000), parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
