require './book'
require './person'

describe  Book do
  context "When testing the Book class" do
    before(:each) do
      @book1 = Book.new 'stormligth',"brandon" 
    end
    it "Creates a book object" do
      expect(@book1).to have_attributes(title: 'stormligth') 
      expect(@book1).to have_attributes(author: 'brandon') 
    end
    it "Creates a rental" do
      person1 = Person.new(22, 'ismael')
      rental1 =  @book1.add_rental "20/10/20", person1
      expect(@book1.rental.length).to eq(1) 
    end
  end
end