require './rental'
require './student'
require './book'

describe Rental do
  context 'When testing Rental class' do
    it 'Check if Rental object it created' do
      student = Student.new 'Web development', 24, 'Soban Syeed', parent_permission: true
      book = Book.new 'Test', 'Principle'
      rental = Rental.new '20/02/23', student, book
      expect(rental).to have_attributes(date: '20/02/23')
      expect(student.rental).to include(Rental)
      expect(book.rental).to include(Rental)
    end
  end
end
