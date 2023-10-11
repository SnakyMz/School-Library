require './trimmer'
require './student'

describe Student do
  context 'When testing student class' do
    before(:all) do
      @student = Student.new 'Web development', 24, 'verylongname', parent_permission: true
    end

    it 'Check correct_name' do
      trimmer = TrimmerDecorator.new(@student)
      expect(trimmer.correct_name).to eql('verylongna')
    end
  end
end
