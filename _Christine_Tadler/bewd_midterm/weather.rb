class Weather 
  attr_accessor :name, :description, :temperature

  def initialize(name, description, temperature)
    @name = name
    @description = description
    @temperature = temperature
  end
  
  # api returns temp as a kelvin value, sooo...
  def get_fahrenheit 
    (@temperature - 273.15) * 1.8 + 32
  end
  
  def to_s 
    "The weather in #{@name} is #{@description}, and the temperature is #{get_fahrenheit.round}°"
  end
end