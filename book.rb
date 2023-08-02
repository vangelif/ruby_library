require 'json'
require 'pry'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title:, author:)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end

  def to_s
    "📚 Title: #{@title} by #{@author}"
  end

  def to_json(*_args)
    JSON.dump({
                title: @title,
                author: @author
              })
  end
  
  def self.from_json(string)
    binding.pry
    data = JSON.load string
    self.new(data['title'], data['author'])
  end
end
