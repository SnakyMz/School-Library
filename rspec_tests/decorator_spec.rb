require './person'
require './decorator'

describe BaseDecorator do
  context 'When testing person class' do
    it 'Check correct_name' do
      person = Person.new 22, 'maximilianus'
      expect(person.correct_name).to eql('maximilianus')
    end
  end
end
