require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

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
      when 3
        create_person
      when 4
        create_book
      when 5
        create_rental
      when 6
        list_rental
      when 7
        break
      else
        puts "Invalid option"
      end 
    end
  end

  def list_all_books
    puts "Library is empty" if @books.empty?
    @books.each_with_index do |book, index|
      puts "#{index+1} - Book: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    puts "No person is registered" if @people.empty?
    @people.each_with_index do |person, index|
      puts "#{index+1} - [Student] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" if person.is_a?(Student)
      puts "#{index+1} - [Teacher] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" if person.is_a?(Teacher)
    end
  end

  def create_person
    while true
      puts "Please select an option"
      puts "1 - Create a student"
      puts "2 - Create a Teacher"
      puts "3 - Back"
      print "Enter your option: "
      person_option = gets.chomp.to_i
      case person_option
      when 1
        create_student
      when 2
        create_teacher
      when 3
        break
      else
        puts "Invalid option"
      end
    end
  end

  def create_student
    print "Enter student name: "
    name = gets.chomp
    print "Enter student age: "
    age = gets.chomp
    print "Enter student's classroom: "
    classroom = gets.chomp
    print "Enter student's parent permission[Y/N]: "
    parent_permission = gets.chomp
    parent_permission = true if parent_permission.eql?('Y' || 'y')
    parent_permission = false if parent_permission.eql?('N' || 'n')
    @people << Student.new(classroom, age, name)
    puts "Student data submitted successfully"
  end

  def create_teacher
    print "Enter teacher name: "
    name = gets.chomp
    print "Enter teacher age: "
    age = gets.chomp
    print "Enter teacher's specialization: "
    specialization = gets.chomp
    @people << Teacher.new(specialization, age, name)
    puts "Teacher data added successfully"
  end

  def create_book
    print "Enter book's title: "
    title = gets.chomp
    print "Enter book's author: "
    author = gets.chomp
    @books << Book.new(title, author)
    puts "Book data added successfully"
  end

  def create_rental
    if @books.empty?
      puts "Please create a book first." 
    elsif @people.empty?
      puts "Please create a person first."
    else 
      list_all_books
      print "Enter book's index: "
      book = gets.chomp.to_i
      book = @books[book-1]
      list_all_people
      print "Enter person's index: "
      person = gets.chomp.to_i
      person = @people[person-1]
      print "Enter date: "
      date = gets.chomp
      @rentals << Rental.new(date, person, book)
      puts "Rental data added successfully"
    end
  end

  def list_rental
    puts "No rentals registered" if @rentals.empty?
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Person: #{rental.person.name}, Book: #{rental.book.title}"
    end
  end
end
