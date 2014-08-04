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

def get_input
	input=gets.chomp
end

#INTRO
def welcome()
	puts "Welcome to Kelly's guessing game!"
	puts "What is your name?"
	name = get_input
	puts "Hi #{name}!"
	puts "Here are the rules: guess a number I am thinking of between 1-10, you have three guesses. Good luck!"
end

def random_number()
	secret_number = (10>1) ? 1+rand((10-1+1)) : 10+rand((1-10+1))
	return secret_number
end

#Guess Response
def guess_response(secret_number, guess)
	if guess > secret_number
		return "Too high!"
	elsif guess < secret_number
		return "Too low!"
	else
		return "You win! Thank you for playing!"
	end
	return answer
end

#RUN METHODS
welcome
secret_number=random_number
#for testing: puts "#{secret_number}" 
attempts=0
while (attempts<3) 
	puts "Enter your guess now. You have #{(3-attempts).to_s} guesses left."	
	guess=get_input.to_i
	if guess>0 && guess<=10
		answer=guess_response(secret_number, guess)
		puts answer
		if answer=="You win! Thank you for playing!"
			attempts=10
		end
	attempts = attempts+1
	end
end

if (attempts == 3) && answer=="Too low!" or answer=="Too high!"
	puts "Game over! The answer was #{secret_number}."
end
