#This is a custom search api from google

require_relative 'lib/googleClient'
#takes 1 input: userinput
#two variables: client & rawreturn
def convertURLtext(text)
	input = text
	while input.index(" ")!=nil
		input[input.index(" ")]="%20"
	end
	return input
end


puts "Welcome to my 'First Google Custom Search' app. This app is design to be the ultimate FAQ for programmer by query only on stackoverflow.com and askubuntu.com sits"

choice = nil

while choice != 'n'
	puts "Enter your Questions Below: "
	userinput = convertURLtext(gets.chop)

	searchResult = GoogleClient.new(userinput)

	searchResult.organize

	puts "Below is a list of possible FAQ on your Questions:"

	searchResult.view_selections

	puts "if you like to search again, enter y(es) or n(o) to exit..."
	choice = gets.chop
end

puts "Thank you for using my 'First Google Custom Search' app! "