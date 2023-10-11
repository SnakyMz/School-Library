require './student'

describe Student do
  context 'When testing student class' do
    before(:all) do
      @student = Student.new 'Web development', 24, 'Soban Syeed', parent_permission: true
    end

    it 'Check if a Student object is created' do
      expect(@student.classroom.label).to eql('Web development')
      expect(@student).to have_attributes(age: 24)
      expect(@student).to have_attributes(name: 'Soban Syeed')
    end

    it 'Check play_hooky' do
      expect(@student.play_hooky).to eql('¯\(ツ)/¯')
    end
  end
end
