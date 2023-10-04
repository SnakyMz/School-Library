require_relative 'person'

# Class Student inherited from Person
class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def assign_classroom(new_classroom)
    @classroom = new_classroom
    new_classroom.students.push(self)
  end
end
