#Trying to build an application that asks a gift recipient's name, what they like out of a list of gift categories and then serve up gift ideas in that category.

require 'json'
require 'rest-client'

require_relative 'lib/recipient.rb'

def create_recipient

	#currently supplying an array of categories on etsy. need to figure out how to get the categories under "gift ideas"
	@description_list = ["Clothing", "toys", "furniture", "pets"]

	puts "--------------New Gift Recipient---------------"
	puts "Who are you shopping for?"
	name = gets.strip
	puts "Which of these does #{name} prefer? \n\n #{@description_list}"
	description = gets.strip

	Recipient.new(name, description)
end



puts "******************Welcome to Gift Picker!****************** \n \n \n"

recipient = create_recipient

recipient.search_gifts



