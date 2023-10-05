require_relative 'app'


def menu
  puts 'Please select an option'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def main
  app = App.new
  puts 'Welcome to School Library'
  loop do
    menu
    print 'Enter your option: '
    option = gets.chomp.to_i
    case option
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rental
    when 7
      break
    else
      puts 'Invalid option'
    end
  end
end

main
