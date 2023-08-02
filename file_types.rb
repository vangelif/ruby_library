module FileTypes
  def get_filename(type)
    file_types = {
      book: 'books.json',
      person: 'persons.json',
      rental: 'rentals.json'
    }

    file_types[type]
  end
end
