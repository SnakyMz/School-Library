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
