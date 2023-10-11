require './trimmer'
require './person'

describe TrimmerDecorator do
  context 'When testing student class' do
    before(:all) do
      @person = Person.new 22, 'maximilianus'
    end

    it 'Check correct_name' do
      trimmer = TrimmerDecorator.new(@person)
      expect(trimmer.correct_name).to eql('maximilian')
    end
  end
end
