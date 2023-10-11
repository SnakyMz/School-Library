require './capitalize'
require './student'

describe Student do
  context 'When testing student class' do
    before(:all) do
      @student = Student.new 'Web development', 24, 'verylongname', parent_permission: true
    end

    it 'Check correct_name' do
      capitalize = CapitalizeDecorator.new(@student)
      expect(capitalize.correct_name).to eql('Verylongname')
    end
  end
end
