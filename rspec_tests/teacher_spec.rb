require './teacher'

describe Teacher do
  context 'When testing teacher class' do
    before(:all) do
      @teacher = Teacher.new 'Web development', 22, 'ismael'
    end
    it 'Check if a teacher object is created' do
      expect(@teacher).to have_attributes(specialization: 'Web development')
      expect(@teacher).to have_attributes(age: 22)
      expect(@teacher).to have_attributes(name: 'ismael')
    end

    it 'Check can_use_services?' do
      expect(@teacher.can_use_services?).to be(true)
    end
  end
end
