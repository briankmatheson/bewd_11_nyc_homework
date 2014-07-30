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
#	  -	Ask for the player's name then personally greet them by printing to the screen, "Hi player_name!"
#	  -	Any good game will communicate the rules. Let the player know they must guess a number between 1 and 10 
#		and that they only have 3 tries to do so.
#
#	Functionality: 
#	 -	Hard code the secret number. Make it a random number between 1 and 10.
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

#Game initialization
@max_guesses = 3
@guess_count = 0
@secret_number = 1 + Random.rand(10)
@guessed_number

#Introduce the player to the game
puts "Welcome to the Secret Number (a Roger Chan Production)"

#Ask for the Player name and welcome them to the game
puts "Please enter your name: "
player_name = gets
puts "Good to have you back, #{player_name}"

#Introduce the rules
puts "You must guess the target number between 1 and 10, you have 3 tries to do so."

#Routine to guess the number and return true if the number is correct, false if the number was incorrect
def ask_for_guess_number 
	puts "Please enter a number between 1 and 10:"
	@guessed_number = gets.to_i
	if @guessed_number == @secret_number
		puts "Congratulations! You won the game!"
		#Player won the game, so return true
		return true
	else
		#Determine if the number was too high or low
		if @guessed_number > @secret_number
			puts "Your guess was too high"
		else
			puts "Your guess was too low"
		end
		#Player lost the guess, so return false
		return false
	end
end

#Player guess three times
while @guess_count < 3
	#Guess the number
	if ask_for_guess_number
		#Don't need to keep on asking for the secret number, exit the game
		break
	else
		#They guessed incorrectly, give them another go
		@guess_count += 1
	end
end

#Game End, Player Lost
if @guess_count == 3
	puts "Bad luck. You guessed incorrectly 3 times. The secret number was #{@secret_number}."
end