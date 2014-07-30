require 'open-uri'

puts "do you like cats? (Yes or No)"
cats = gets.chomp
 if cats == 'Yes'

kittens = open('http://placekitten.com/')
body = kittens.read[559, 441]

puts body
puts "See the computer Cat Attack!"

elsif cats == "No"
	puts "I like dogs too"
	puts "..but the dog placeholder site wasn't working, or anything else! So you just get text for now instead"

else cats != "No" || "Yes" 
 puts "There are only Dog or Cat people allowed to run this program! Sorry!"
end
 

