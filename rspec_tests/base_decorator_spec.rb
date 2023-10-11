require './decorator'

describe BaseDecorator do
    context('when testing the Person class') do
        before(:each) do
            @base_decorator = BaseDecorator.new('ismael')
        end
        it "Checks if the base_decorator has been created" do
          expect(@base_decorator).to have_attributes(nameable: 'ismael')
        end
    end
end