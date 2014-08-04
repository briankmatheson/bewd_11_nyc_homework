#Recipient Class
class Recipient

	attr_accessor :name, :description

	def initialize(name, description)
		@name = name
		@description = description
	end

	def to_s
		"You're shopping for #{@name}, in the #{@description} gift category."
	end

	def search_gifts
		#This calls active listings under the category supplied by user. Need to figure out how to get only gift ideas> category 
		etsy_api = JSON.load(RestClient.get("https://openapi.etsy.com/v2/listings/active?api_key=mgzshgbo2hgqvgsejc7pgdun&#{@description}"))
	
		puts "Would any of these interest #{name}? Enter (1), (2) or (3)"

		@listing_titles = Array.new

		
		#List out first three gift ideas from the category and number them. 
		#Next I'll get the user input for which one they like best (if any) and then get that item's url
		1.upto(3) do |number|
			etsy_api["results"].take(3).each do |listing|
				@title = listing["title"]

				puts "(#{number}) #{@title}"

			end
		end
	end	
end
