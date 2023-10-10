def load_books
  books = []
  return books if File.empty?('books.json')

  booksdata = File.read('books.json')
  bookarray = JSON.parse(booksdata)
  bookarray.each do |book|
    books << Book.new(book['title'], book['author'])
  end
  books
end

def load_people
  people = []
  return people if File.empty?('people.json')

  peopledata = File.read('people.json')
  peoplearray = JSON.parse(peopledata)
  peoplearray.each do |person|
    if person['class'] == 'student'
      people << Student.new(person['classroom'], person['age'], person['name'], person['id'],
                            parent_permission: person['parent_permission'])
    elsif person['class'] == 'teacher'
      people << Teacher.new(person['specialization'], person['age'], person['name'], person['id'])
    end
  end
  people
end

def load_rentals
  rentals = []
  return rentals if File.empty?('rentals.json')

  rentalsdata = File.read('rentals.json')
  rentalsarray = JSON.parse(rentalsdata)
  rentalsarray.each do |rental|
    person_id = rental['person']
    person = @people.select { |per| per.id.eql?(person_id) }
    book_title = rental['book']
    book = @books.select { |bk| bk.title.eql?(book_title) }
    rentals << Rental.new(rental['date'], person[0], book[0])
  end
  rentals
end
