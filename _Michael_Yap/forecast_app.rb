
# Office Hours Notes
# ==============================================================================
# Calculate the current time, offer 24 hrs forecast
# Break up the program in separate files
# For lines 32 and on, put in a separate file
# In the main rb file, call the class
# Create a git branch, to put the working program into a branch
# git checkout -b name-of-branch
# git checkout name-of-branch
# git branch

# Assignment
# ==============================================================================

# Create a command line based application that fulfills these criteria:

# 1) Takes user input and handles bad input (i.e. You expect numbers and they give you a letter).
# 2) Connects to a 3rd party api where the call varies based on what the user gives you.
# 3) Must be object oriented. You must instantiate modeled classes. The only file that can run without classes is your runner.
# 4) Push code on Github.

# Pseudocode
# ==============================================================================

# Choose a spot
# Provide a report

# Requires
# ==============================================================================

# Require library of methods from json
require 'json'
# Require library of methods from rest-client
require 'rest-client'
require_relative 'forecast'

# The San Francisco county feed
@county_san_francisco_json = RestClient.get('http://api.spitcast.com/api/county/spots/san-francisco/')
@county_san_francisco = JSON.load(@county_san_francisco_json)

def get_input
  #Get input from the user.
  return gets.chomp
end

def build_spots(county)

	@spots = Array.new
	
	# ORIGINAL LOOP

	# This seems weird
	# i = 0

	# county.each do |spot|
		# Store the spot name and ID
		# @spots[i][:spot_name] = spot["spot_name"]
		# @spots[i][:spot_id] = spot["spot_id"]
		# i += 1
	# end

	# ALTERNATE LOOP

	county.each do |spot|
	
		# Create a temporary hash to store the spot_name and spot_id, push the hash to the array
		# Re-initialize the hash every time the loop is run
		tmp_spot = Hash.new
		tmp_spot[:spot_name] = spot["spot_name"]
		tmp_spot[:spot_id] = spot["spot_id"]
		@spots << tmp_spot
		puts "Size of @spots: #{@spots.length}"
	
	end

end

build_spots(@county_san_francisco)


puts "Welcome to the Ruby version of Spitcast: the best forecast for surf spots in the San Francisco Bay Area, including:"

puts "\n"

@ol = 1

@spots.each do |spot_name| 	
	puts "#{@ol}. #{spot_name[:spot_name]}"
	@ol += 1
end

puts "\n"

loop do 
	print "Enter a surf spot: "
	@user_chosen_spot = get_input
	if @user_chosen_spot.empty?
	    puts "Oops, try again."
  else
    break
  end
end

forecast = Forecast.new(@user_chosen_spot)
forecast.get_forecast





