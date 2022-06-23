require './rental'
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end
