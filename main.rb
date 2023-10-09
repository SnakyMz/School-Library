require_relative 'app'

def run
  loop do
    menu
    option = gets.chomp.to_i
    break if option == 7

    options(option)
  end
end

def menu
  puts 'Welcome to School Library'
  puts 'Please select an option'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  print 'Enter your option: '
end

def options(option)
  app = App.new
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
  else
    puts 'Invalid option'
  end
end

def main
  run
end

main
