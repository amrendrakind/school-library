class Data
  attr_reader :persons, :books, :rentals

  def initialize
    @persons = []
    @books = []
    @rentals = []
  end
end
