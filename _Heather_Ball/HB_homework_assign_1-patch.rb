###############################################################################
#
# Back-End Web Development - Homework #1
#
# Secret Number is a game you will build in two parts.
# The purpose of the game is to have players guess a secret number from 1-10.
#
# Read the instructions below.
# This exercise will test your knowledge of Variables and Conditionals.
#
###############################################################################
#
# We're ready to program! To practice our Ruby skills lets create a secret number game. 
# In this game players have three tries to guess a secret number between 1 and 10. 
#
# Here are some guidelines to building your game:
#
#	Intros
# 	-	Welcome the player to your game. Let them know who created the game. 
puts "Welcome, player! HB has created the game, so sit back relax and enjoy!"
#	  -	Ask for the player's name then personally greet them by printing to the screen, "Hi player_name!"

puts "What is your name, per favore?"

user_name=gets.chomp

puts "Hallo there, #{user_name}"

#	  -	Any good game will communicate the rules. Let the player know they must guess a number between 1 and 10 
#		and that they only have 3 tries to do so.

puts "Now, for the game-- you must guess the number I am thinking of between 1 and 10, with only three tries...Godspeed!"
#
#	Functionality: 
#	 -	Hard code the secret number. Make it a random number between 1 and 10.

puts "What is your first guess?"
user_guess = gets.chomp

def secret_number_game(user_guess)

secret_number = 4

	if user_guess < secret_number
		puts "Oops, not high enough!"
	elsif user_guess > secret_number
		puts "That's a tad too high..."
	else user_guess == secret_number
		puts "Congratulations, you've guessed it!"
	end	

# 	count = 3

# while count>1
# 	puts "You have #{count} guesses left...use them wisely..."
# 	count -=1
# end
# 	if count == 1
# 		puts "Okay, last shot!"
# 	end
end

puts secret_number_game(user_guess)


# Hey guys-- this is where I'm at right now-- I'm going to keep workiong on it, but wanted to upload something- Heather Ball

#	 - 	Ask the user for their guess.
#	 -	Verify if they were correct. If the player guesses correctly they win the game they should be congratulated and the game should end.
#	 -	If they guess incorrectly, give the player some direction. If they guess too high let them know, if they guess too low, let them know.
#	 - 	Don't forget to let your players know how many guesses they have left. Your game should say something like
#		  "You have X many guesses before the game is over enter a another number"
#	 -	If they don't guess correctly after 3 tries, print that the Player lost and the game is over. Also let them know what the `secret_number` was.
#
# Make sure to add helpful comments to your code to document what each section does.
# 
# Remember to cast input from the Player into the appropriate data type.
#
###############################################################################

