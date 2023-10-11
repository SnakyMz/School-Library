require_relative '../person'
require_relative '../book'

describe Person do
    context('when testing the Person class') do
        before(:each) do
            @person1 = Person.new(32, 'Khan Mohammad')
        end
        it 'creates a person object' do
            expect(@person1).to have_attributes(age: 32)
            expect(@person1).to have_attributes(name: 'Khan Mohammad')
        end
        it 'checks the add_rental ' do
            book = Book.new('Python programmin', 'Hossain')
            @person1.add_rental "20/10/20", book
            expect(@person1.rental).to include(Rental)
        end
        it 'checks the can_use_services? ' do
            expect(@person1.can_use_services?).to eq(true)
        end
        it 'checks the of_age:' do
            expect(@person1.send(:of_age?)).to eq(true)
        end
        it 'checks the correct_name:' do    
            expect(@person1.send(:correct_name)).to eq('Khan Mohammad')
        end

    end
end