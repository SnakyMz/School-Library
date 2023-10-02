class Person
  attr_reader :id :name :age
  attr_writer :name :age

  def initialize(name = "Unknown", age, parent_permission = true)
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
end