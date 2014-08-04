#takes 1 input: userinput
#2 methods

require 'rest-client'
require 'json'
class GoogleClient
	attr_accessor :client, :rawreturn, :selections
	
	def initialize(userinput)
		puts "connecting to custom google search client..."

		@client = RestClient.get("https://www.googleapis.com/customsearch/v1?key=AIzaSyA-Svo7dny7m2D3JCDmOo4gE0CapT6EJ8M&cx=004935054672335946665:hajo5bh4cvg&q=#{userinput}")
		@rawreturn = JSON.load(client)
		@selections = []

		puts "connection establish. initialization complete!"

	end

	def organize
		puts "organizing results..."

		rawreturn["items"].each do |item|
			selections << {description: item["snippet"], link: item["link"]}
		end

		puts "organization complete!"
	end

	def view_selections
		puts "\n\n"
		choice = 'y'
		selections.each do |each|
			if choice == 'y'
				puts each[:description]
				puts each[:link]
				puts "-------------------------------------------------------------------\n"
				puts "press y(es) to continure or n(o) to exit"
				choice = gets.chop
			else
				break
			end
		end
	end
end
