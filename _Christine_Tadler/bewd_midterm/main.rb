require 'json'
require 'rest-client'
require_relative 'weather'

def get_weather
  # get user input
  city = gets.chomp

  # prompt the user again if they don't type an answer
  while city.empty?
    puts "I SAID, tell me what CITY you're in."
    city = gets.chomp
  end
  
  # create variable from openweathermap url
  weather_url = "http://api.openweathermap.org/data/2.5/weather"
  
  # add user input as url parameter to get the full city url
  weather_client = RestClient.get(weather_url, {params: {q: city}})
  
  # parse into json object
  weather_json = JSON.load(weather_client)

  # create a variable from the value of the cod key
  weather_cod = weather_json["cod"]

  # use the cod variable to test if the user entered a real city
  if weather_cod == "404"
    puts "That's not a city! Try again. Be serious this time."
    get_weather
  else
    
    # if the user entered a valid city, create variables from certain keys
    # and use them to create an instance of the weather class
    weather_name = weather_json["name"]
    weather_desc = weather_json["weather"].first["description"]
    weather_temp = weather_json["main"]["temp"]
    
    weather = Weather.new(weather_name, weather_desc, weather_temp)
    puts weather
  end
end

puts "Looking for weather information? Tell me what city you're in."
get_weather
