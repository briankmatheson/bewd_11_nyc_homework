# Write a program that prints 99 bottles of beer on the wall.
# The song starts with 
# 99 bottles of beer on the wall
# 99 bottles of beer!
# You take one down and pass it around,
# 98 bottles of beer on the wall!
#
# And ends with 
# 1 bottle of beer on the wall
# 1 bottle of beer!
# You take one down and pass it around,
# No more bottles of beer on the wall :-(


require 'active_support/inflector'

#Intro
puts "This is the \'99 Beers song\'"

# Set the beer counter
beer_count = 99

# Sing the song 99 to last bottle
while beer_count > 1
	puts "#{beer_count} " + "bottle".pluralize(beer_count) + " of beer on the wall"
	puts "#{beer_count} " + "bottle".pluralize(beer_count) + " of beer!"
	puts "You take one down and pass it around,"
	beer_count -= 1
	puts "#{beer_count} " + "bottle".pluralize(beer_count) + " of beer on the wall!"
	puts ""
end

# Finish the song
puts "1 bottle of beer on the wall"
puts "1 bottle of beer!"
puts "You take one down and pass it around,"
puts "No more bottles of beer on the wall :("


# could also use 99.downto(1) |bottles|