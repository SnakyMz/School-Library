require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'when testing the Classroom class' do
    before(:each) do
      @classroom1 = Classroom.new('C1')
    end

    it 'creates a classroom object' do
      expect(@classroom1).to have_attributes(label: 'C1')
    end
    it 'checks the add_student ' do
      student = Student.new('A1', 32, 'Khan Mohammad')
      @classroom1.add_student student
      expect(@classroom1.students).to include(Student)
    end
  end
end
