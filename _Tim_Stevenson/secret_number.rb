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
		
		@guesses_remaining = 3

		def guess(guess_number)

			@guesses_remaining = @guesses_remaining - 1

			if @guesses_remaining != 1
				guess_plural = "guesses"
			else
				guess_plural = "guess"
			end

			guess_again = "you have #{@guesses_remaining} #{guess_plural} left. Try again:"



			if guess_number > @number
				if @guesses_remaining > 0
					puts "too high, #{guess_again}" 
					guess_number = gets.chomp.to_i
					guess(guess_number)
				else
					puts "Game Over! The number was #{@number}"
				end	
			elsif guess_number < @number
				if @guesses_remaining > 0
					puts "too low, #{guess_again}"
					guess_number = gets.chomp.to_i
					guess(guess_number)
				else
					puts "Game Over! The number was #{@number}"					
				end
			else
				puts "you win!"
			end
		end



# 	-	Welcome the player to your game. Let them know who created the game. 
<<<<<<< HEAD:homework/01_secret_number/secret_number.rb
puts "Welcome, player! HB has created the game, so sit back relax and enjoy!"
#	  -	Ask for the player's name then personally greet them by printing to the screen, "Hi player_name!"

puts "What is your name, per favore?"

user_name=gets
puts user_name

puts "Hallo there, #{user_name}!"

#	  -	Any good game will communicate the rules. Let the player know they must guess a number between 1 and 10 
#		and that they only have 3 tries to do so.

puts "Now, for the game-- you must guess the number I am thinking of between 1 and 10, with only three tries...Godspeed!"
=======
# 		puts "Welcome to the secret number game"

# #	  -	Ask for the player's name then personally greet them by printing to the screen, "Hi player_name!"
		puts "What is your name?"
		player_name = gets.chomp

		puts "Hi, #{player_name} !"

#	  -	Any good game will communicate the rules. Let the player know they must guess a number between 1 and 10 
#		and that they only have 3 tries to do so.
		puts "Guess a number between 1 and 10 in 3 tries to win."

		@number = 7

		puts "Guess 1:"

		guess_number = gets.chomp.to_i

		guess(guess_number)

		
>>>>>>> 7c26ac60a937675216eafd4289c71f93d36665bb:_Tim_Stevenson/secret_number.rb
#
#	Functionality: 
#	 -	Hard code the secret number. Make it a random number between 1 and 10.

def secret_number_game
	secret_number = 4

	if gets > 4
		return "Oops, not high enough!"
	if else gets < 4
		return "That's a tad too high..."
	if gets == 4
		return "Congratulations, you've guessed it!"
	end	

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

