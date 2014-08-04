#Call for Class/Json/Rest-Client
require_relative 'lib/Images'
require 'json'
require 'rest-client'

#API call for Instagram
inst_client = RestClient.get("https://api.instagram.com/v1/media/popular?client_id=469a322054d54925a7017cbdb5ae5338")
inst_data = JSON.load(inst_client)

#Definitions

def get_input 
	input=gets.chomp
end

#Making Arrays for each image post

@all_images= Array.new

	inst_data["data"].each do |image|
		@image_url = image["images"]["standard_resolution"]["url"]
		@username = image["user"]["username"]
		@likes = image ["likes"]["count"]
		all_images << {image: @image_url, user: @username, likes: @likes}
	end

# Running the program

counter=0
puts "~~~~Top Trending Images on Instagram~~~~"
puts "Welcome to Instagram, what is your name?" 
name = get_input
puts "Hi #{name}, would you like to check out the latest instagram images? Y/N"
response = get_input
	if response==Y 
		loop do |image|
			break if @counter == @all_images.length
			@image.each
			puts "Image: #{image_url}, By #{username}, Likes: #{likes}"
			@counter += 1
		end
	else put "Come back soon and check them out later!"
	end 
