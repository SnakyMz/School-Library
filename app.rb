require_relative 'book'
require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'

# Class containing script for user interface
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    puts "Welcome to School Library"
    while true
      puts "Please select an option"
      puts "1 - List all books"
      puts "2 - List all people"
      puts "3 - Create a person"
      puts "4 - Create a book"
      puts "5 - Create a rental"
      puts "6 - List all rentals for a given person id"
      puts "7 - Exit"
      print "Enter your option: "
      option = gets.chomp.to_i
      case option
      when 1
        list_all_books
      when 2
        list_all_people
      when 7
        break
      else
        puts "Invalid option"
      end 
    end
  end
end
