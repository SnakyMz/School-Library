require 'json'

def store_books(class_books)
  books = []
  class_books.each do |book|
    books << { title: book.title, author: book.author }
  end
  books_json = JSON.generate(books)
  File.write('books.json', books_json)
end

def store_people(class_people)
  people = []
  class_people.each do |person|
    if person.is_a?(Student)
      people << { class: 'student', classroom: person.classroom.label, age: person.age, name: person.name,
                  id: person.id, parent_permission: person.parent_permission }
    elsif person.is_a?(Teacher)
      people << { class: 'teacher', specialization: person.specialization, age: person.age, name: person.name,
                  id: person.id }
    end
  end
  people_json = JSON.generate(people)
  File.write('people.json', people_json)
end

def store_rentals(class_rentals)
  rentals = []
  class_rentals.each do |rental|
    rentals << { date: rental.date, person: rental.person.id, book: rental.book.title }
  end
  rentals_json = JSON.generate(rentals)
  File.write('rentals.json', rentals_json)
end
