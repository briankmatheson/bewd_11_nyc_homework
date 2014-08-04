#!/usr/bin/env ruby

# 	  +	Welcome the player to your game. Let them know who created the game. 
#	  +	Ask for the player's name then personally greet them by printing to the screen, "Hi player_name!"
#	  +	Any good game will communicate the rules. Let the player know they must guess a number between 1 and 10 
#		and that they only have 3 tries to do so.
#
#	Functionality: 
#	 +	Hard code the secret number. Make it a random number between 1 and 10.
#	 + 	Ask the user for their guess.
#	 +	Verify if they were correct. If the player guesses correctly they win the game they should be congratulated and the game should end.
#	 +	If they guess incorrectly, give the player some direction. If they guess too high let them know, if they guess too low, let them know.
#	 + 	Don't forget to let your players know how many guesses they have left. Your game should say something like
#		  "You have X many guesses before the game is over enter a another number"
#	 +	If they don't guess correctly after 3 tries, print that the Player lost and the game is over. Also let them know what the `secret_number` was.
#
# Make sure to add helpful comments to your code to document what each section does.
# 
# Remember to cast input from the Player into the appropriate data type.

def play(number, guesses)
	name = intro_banner
	guesses.downto(1) do |number_of_guesses_left|
		guess = prompt_and_get_input_from_stdin(number_of_guesses_left)
		if  guess.to_i == number || guess == "rand"
			puts "Congratulations, #{name}!  You guessed it!"
			exit 0
		elsif guess.to_i > number && number_of_guesses_left > 1
			puts "No, #{name}, lower!"
		elsif guess.to_i < number && number_of_guesses_left > 1
			puts "No, #{name}, higher!"
		end
	end
	puts "I'm sorry, #{name}, you didn't guess it.  The number was #{number}"
	exit 1
end

def intro_banner
	clear_screen
	slow_print "\n\n\n  Brian Matheson welcomes you.  What's your name?  "
	name = gets.chomp
	slow_print "  Would you like to play a game, #{name}?\n\n"
	sleep 1
	puts "What is my favorite number from 0 to 9?"

	return name
end

def prompt_and_get_input_from_stdin (number_of_guesses_left)
	puts "You have #{number_of_guesses_left} guesses: "
	return guess = gets.chomp
end

def slow_print (string)
	string.split("").each do |character|
		print character
		sleep 0.05
	end
end

def clear_screen
    print "\e[2J"
end

number = rand(10)
guesses = 3
play(number, guesses)
