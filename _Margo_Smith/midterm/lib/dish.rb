#Dish class
class Dish
	attr_accessor :name, :price, :name_array

  def initialize(name, price)
    @name = name
    @price = price
    @name_array = name.split
  end

end