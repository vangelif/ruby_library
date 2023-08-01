module Choice
  def choose_a_number(app, choice)
    case choice
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_a_person
    when 4
      app.create_a_book
    when 5
      app.create_a_rental
    when 6
      app.list_rentals
    end
  end
end
