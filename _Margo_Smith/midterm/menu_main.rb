# RIGHT NOW THIS CODE ONLY WORKS FOR 1851, I THINK BECAUSE OF SOME SORT OF STRANGENESS IN THE API, WILL INVESTIGATE AND UPDATE

require 'json'
require 'rest-client'

require_relative 'lib/menu'
require_relative 'lib/dish'

# Get user input, make sure that it is valid
year = 0
loop do 
	puts "Enter a year for which you would like menu information"
	year = gets.chomp.to_i
	break if year > 1850 && year < 2009
	puts "Menu data is only availble from 1851 to 2008. Please enter a valid year."
end

# Initial API call, returns all menus from specified year
menu_client = RestClient.get('http://api.menus.nypl.org/menus?min_year=' + year.to_s + '&max_year=' + (year + 1).to_s + '&token=u73fhwjmsru4ulrs6elhanmf44')
menus = JSON.load(menu_client)

count = menus["stats"]["count"]

puts "There are " + count.to_s + " menus from " + year.to_s

words = []
# Creates objects for all menus from the given year, creates an array of all of the words used in a menu title for a given year
menus["menus"].each do |menu|
	id = menu["id"]
	menu_obj = Menu.new(id, menu["name"], menu["location"], menu["place"], menu["year"], menu["month"], menu["day"], menu["dish_count"])

	# Secondary API call, returns all dishes from a specified menu
	dish_client = RestClient.get('http://menus.nypl.org/api/menus/' + id.to_s + '/dishes?token=u73fhwjmsru4ulrs6elhanmf44')
	dishes = JSON.load(dish_client)

	# Creates a dish object for each dish on a given menu, adds dish object to dishes array of menu object
	dishes["dishes"].each do |dish|
		dish_obj = Dish.new(dish["name"], dish["price"])
		menu_obj.dishes << dish_obj
		dish_obj.name_array.each do |word|
			words << word
		end
	end

end

# Creates a hash 
freq = words.inject(Hash.new(0)) { |key, value| 
	key[value] += 1
	key 
}


puts freq.sort_by{|key, value| value}


