require 'pathname'
require 'fileutils'

require_relative '../app'
require_relative '../book'
require_relative '../student'
require_relative '../teacher'
require_relative '../rental'

describe App do
  describe 'creates an App instance' do
    FileUtils.rm_rf('spec/data')
    it 'the result is an instance of App class' do
      app = App.new('spec/data/')
      expect(app).to be_an_instance_of App
    end
  end

  describe 'App instance variables are initialize to empty arrays' do
    it 'the @books instance variable is an empty array' do
      app = App.new('spec/data/')
      expect(app.books).to be_empty
    end

    it 'the @persons instance variable is an empty array' do
      app = App.new('spec/data/')
      expect(app.persons).to be_empty
    end

    it 'the @rentals instance variable is an empty array' do
      app = App.new('spec/data/')
      expect(app.rentals).to be_empty
    end
  end

  describe 'when you exit the app it saves the data to json files' do
    it 'creates a \'books.json\' file to store books' do
      app = App.new('spec/data/')
      book = Book.new(title: 'Chemistry for newbies', author: 'The teacher')
      app.books.push(book)
      app.save
      expect(Pathname.new('spec/data/books.json')).to exist
      FileUtils.rm_rf('spec/data')
    end

    it 'creates a \'persons.json\' file to store persons' do
      app = App.new('spec/data/')
      person = Teacher.new(name: 'Mr. Smith', age: 35, specialization: 'Chemistry')
      app.persons.push(person)
      app.save
      expect(Pathname.new('spec/data/persons.json')).to exist
      FileUtils.rm_rf('spec/data')
    end

    it 'creates a \'rentals.json\' file to store rentals' do
      app = App.new('spec/data/')
      book = Book.new(title: 'Chemistry for newbies', author: 'The teacher')
      person = Teacher.new(name: 'Mr. Smith', age: 35, specialization: 'Chemistry')
      rental = Rental.new('2023-08-02', book, person)
      app.rentals.push(rental)
      app.save
      expect(Pathname.new('spec/data/rentals.json')).to exist
      FileUtils.rm_rf('spec/data')
    end
  end

  describe 'when you start the app it loads the data from json files' do
    it 'loads books from \'books.json\' file' do
      app = App.new('spec/data/')
      book = Book.new(title: 'Chemistry for newbies', author: 'The teacher')
      app.books.push(book)
      app.save
      new_app = App.new('spec/data/')
      expect(new_app.books).not_to be_empty
      expect(new_app.books.size).to eql 1
      FileUtils.rm_rf('spec/data')
    end

    it 'loads persons from \'persons.json\' file' do
      app = App.new('spec/data/')
      person = Teacher.new(name: 'Mr. Smith', age: 35, specialization: 'Chemistry')
      app.persons.push(person)
      app.save
      new_app = App.new('spec/data/')
      expect(new_app.persons).not_to be_empty
      expect(new_app.persons.size).to eql 1
      FileUtils.rm_rf('spec/data')
    end

    it 'loads rentals from \'rentals.json\' file' do
      app = App.new('spec/data/')
      book = Book.new(title: 'Chemistry for newbies', author: 'The teacher')
      person = Teacher.new(name: 'Mr. Smith', age: 35, specialization: 'Chemistry')
      rental = Rental.new('2023-08-02', book, person)
      app.books.push(book)
      app.persons.push(person)
      app.rentals.push(rental)
      app.save
      new_app = App.new('spec/data/')
      expect(new_app.rentals).not_to be_empty
      expect(new_app.rentals.size).to eql 1
      FileUtils.rm_rf('spec/data')
    end
  end

  describe 'when you start the app if there are no json files' do
    it '@books is an empty array' do
      FileUtils.rm_rf('spec/data')
      app = App.new('spec/data/')
      expect(Pathname.new('spec/data/books.json')).not_to exist
      expect(app.books).to be_empty
      expect(app.books.size).to eql 0
    end

    it '@persons is an empty array' do
      FileUtils.rm_rf('spec/data')
      app = App.new('spec/data/')
      expect(Pathname.new('spec/data/persons.json')).not_to exist
      expect(app.persons).to be_empty
      expect(app.persons.size).to eql 0
    end

    it '@rentals is an empty array' do
      FileUtils.rm_rf('spec/data')
      app = App.new('spec/data/')
      expect(Pathname.new('spec/data/rentals.json')).not_to exist
      expect(app.rentals).to be_empty
      expect(app.rentals.size).to eql 0
    end
  end
end
