require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'validate_input'

# Class containing script for user interface
class App
  def initialize
    @books = load_books
    @people = load_people
    @rentals = load_rentals
  end

  def run(option)
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
      exit_app
      exit
    else
      puts 'Invalid option'
    end
  end

  def load_books
    def load_books
      books = []
      return books unless File.read("people.json") != ''
      booksdata = File.read("books.json")
      bookarray = JSON.parse(booksdata)
      bookarray.each do |book|
        books << Book.new(book['title'], book['author'])
      end
      books
    end
  end

  def load_people
    def load_people
      people = []
      return people unless File.read("people.json") != ''
      peopledata = File.read("people.json")
      peoplearray = JSON.parse(peopledata)
      peoplearray.each do |person|
        if person['class'] == 'student'
          people << Student.new(person['classroom'], person['age'], person['name'])
        elsif person['class'] == 'teacher'
          people << Teacher.new(person['specialization'], person['age'], person['name'])
        end
      end
      people
    end
  end

  def load_rentals
    def load_rentals
      rentals = []
      return rentals unless File.read("rentals.json") != ''
      rentalsdata = File.read("rentals.json")
      rentalsarray = JSON.parse(rentalsdata)
      rentalsarray.each do |rental|
        rentals << Rental.new(rental['date'], rental['person'], rental['book'])
      end
      rentals
    end
  end

  def list_all_books
    puts 'Library is empty' if @books.empty?
    @books.each_with_index do |book, index|
      puts "#{index + 1} | Book: #{book.title} | Author: #{book.author}"
    end
  end

  def list_all_people
    puts 'No person is registered' if @people.empty?
    @people.each_with_index do |person, index|
      if person.is_a?(Student)
        puts "#{index + 1} [Student] ID: #{person.id} | Name: #{person.name} | Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "#{index + 1} [Teacher] ID: #{person.id} | Name: #{person.name} | Age: #{person.age}"
      end
    end
  end

  def create_person
    puts 'Please select an option'
    puts '1 - Create a student'
    puts '2 - Create a Teacher'
    print 'Enter your option: '
    person_option = user_input('int')
    case person_option
    when 1
      @people << create_student
      puts 'Student data submitted successfully'
    when 2
      @people << create_teacher
      puts 'Teacher data added successfully'
    else
      puts 'Invalid option'
    end
  end

  def create_student
    print 'Enter student name: '
    name = user_input('str')
    print 'Enter student age: '
    age = user_input('str')
    print "Enter student's classroom: "
    classroom = user_input('str')
    print "Enter student's parent permission[Y/N]: "
    parent_permission = user_input('str')
    Student.new(classroom, age, name, parent_permission: parent_permission)
  end

  def create_teacher
    print 'Enter teacher name: '
    name = user_input('str')
    print 'Enter teacher age: '
    age = user_input('str')
    print "Enter teacher's specialization: "
    specialization = user_input('str')
    Teacher.new(specialization, age, name)
  end

  def create_book
    print "Enter book's title: "
    title = user_input('str')
    print "Enter book's author: "
    author = user_input('str')
    @books << Book.new(title, author)
    puts 'Book data added successfully'
  end

  def create_rental
    if @books.empty?
      puts 'Please create a book first.'
    elsif @people.empty?
      puts 'Please create a person first.'
    else
      list_all_books
      print "Enter book's index: "
      book = user_input('int')
      book = @books[book - 1]
      list_all_people
      print "Enter person's index: "
      person = user_input('int')
      person = @people[person - 1]
      print 'Enter date: '
      date = user_input('str')
      @rentals << Rental.new(date, person, book)
      puts 'Rental data added successfully'
    end
  end

  def list_rental
    if @rentals.empty?
      puts 'No rentals registered'
    else
      list_all_people
      print "Enter person's ID: "
      id = user_input('int')
      rents = @rentals.select { |rental| rental.person.id.eql?(id) }
      rents.each do |rent|
        puts "Date: #{rent.date} | Person: #{rent.person.name} | Book: #{rent.book.title} by #{rent.book.author}"
      end
    end
  end

  def exit_app
  end
end
