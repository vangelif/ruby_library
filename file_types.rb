module FileTypes
  def get_filename(type)
    file_types = {
      book: 'books.json',
      person: 'persons.json',
      rental: 'rentals.json'
    }

    file_types[type]
  end

  def get_objtype(type)
    obj_types = {
      book: Book,
      person: Person,
      teacher: Teacher,
      student: Student,
      rental: Rental
    }
    obj_types[type]
  end
end
