require 'json'
require 'rest-client'

# Get user input:
puts "Hello, welcome to BEER-FINDER created by Margo Smith"
puts "What kind of beer would you like?"
beer_type = gets.chomp.downcase
puts "Minimum ABV?"
min_ABV = gets.chomp.to_f
puts "Maximum ABV?"
max_ABV = gets.chomp.to_f

# Make API call, create beer objects, search descriptions, narrow by ABV values
beer_client = RestClient.get('http://api.openbeerdatabase.com/v1/beers.json?per_page=100')
beers = JSON.load(beer_client)

acceptable_beers = []

beers["beers"].each do |beer|

	description_array = beer["description"].downcase.split

	includes_search_term = false	
	description_array.each do |word|
		if word == beer_type
			includes_search_term = true
		end
	end

	if (includes_search_term && beer["abv"] > min_ABV && beer["abv"] < max_ABV)
		acceptable_beers << beer
	end

end

#beer["description"].downcase.include?(" " + beer_type)

if acceptable_beers.size < 1
	puts "There are no beers for you. Better find some wine!"
end

puts "Here are the beers that meet your criteria:"

acceptable_beers.each do |beer|
	puts "#{beer["name"]} from #{beer["brewery"]["name"]}"
end

# We suggest you get to the ____ brewery as fast as possible!

#beers["beers"].each do |beer|
# 	if beer["description"].downcase.include? beer_type.to_s
#		puts "HELLO"
#	end
#end