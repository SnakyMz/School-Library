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

  def load_books; end

  def load_people; end

  def load_rentals; end

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
    books = []
    @books.each do |book|
      books << { title: book.title, author: book.author }
    end
    books_json = JSON.generate(books)
    booksfile = File.write('books.json', books_json)

    people = []
    @people.each do |person|
      if person.is_a?(Student)
        people << { class: 'student', classroom: person.classroom.label, age: person.age, name: person.name }
      elsif person.is_a?(Teacher)
        people << { class: 'teacher', specialization: person.specialization, age: person.age, name: person.name }
      end
    end
    people_json = JSON.generate(people)
    peoplefile = File.write('people.json', people_json)

    rentals = []
    @rentals.each do |rental|
      rentals << { date: rental.date, person: rental.person, book: rental.book }
    end
    rentals_json = JSON.generate(rentals)
    rentalsfile = File.write('rentals.json', rentals_json)

    puts 'Thanks for using our app'
  end
end
