#Menu class
class Menu
  attr_accessor :id, :name, :location, :place, :year, :month, :day, :dish_count, :dishes

  def initialize(id, name, location, place, year, month, day, dish_count)
    @id = id
    @name = name
    @location = location
    @place = place
    @year = year
    @month = month
    @day = day
    @dish_count = dish_count
    @dishes = []
  end

end