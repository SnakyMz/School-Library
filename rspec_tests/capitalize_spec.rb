require './capitalize'
require './person'

describe CapitalizeDecorator do
  context 'When testing student class' do
    before(:all) do
      @person = Person.new 22, 'maximilianus'
    end

    it 'Check correct_name' do
      capitalizer = CapitalizeDecorator.new(@person)
      expect(capitalizer.correct_name).to eql('Maximilianus')
    end
  end
end
