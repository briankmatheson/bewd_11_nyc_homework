# Homework #1 - Secret Number Game
# In this game players have three tries to guess a secret number between 1 and 10. 
#
# Here are some guidelines to building your game:
#
#	Intros
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
#
############################################################################### 	
require "active_support/core_ext/integer/inflections" #supports the ordinalize method

# Set default values
count = 1
max_guesses = 3
min_num = 1
max_num = 10
secret_number = rand(1..10)

def intro
	# Program introduction, user info get, and rules sections
	puts ""
	puts "          |------------------------|"
	puts "          | THE SECRET NUMBER GAME |"
	puts "          |                        |"
	puts "          |               by: ~STH |"
	puts "          |------------------------|"
	puts ""
end

def get_name
	puts "Player, what is your name?"
	return player_name = gets.chomp
end

def display_rules(player_name,min_num, max_num, max_guesses)
	puts ""
	puts "Hi, #{player_name}! Get ready to guess... but first, the rules."
	puts ""
	puts "Rules:"
	puts "- the number will be an integer between #{min_num} and #{max_num}."
	puts "- you will have #{max_guesses} chances to guess the secret number."
	puts ""
end

# Guessing section

def the_game(count, min_num, max_num, max_guesses, secret_number)
	loop do # Loop controls input of guesses
	  # Prompts for the guess and informs of the guess count.
	  puts "What is your #{count.ordinalize} guess? (#{count}/#{max_guesses})"
	  guess = gets.to_i
	  
	  # check guess against bounds and then secret number
	  if guess > max_num || guess < min_num
	  	puts "Wasted guess! You're supposed to guess an integer between 1 and 10."
	  	count +=1
	  elsif guess == secret_number
	  	puts "You won!"
	  	break
	  elsif guess > secret_number
	  	puts "Too high!"
	  	count += 1
	  elsif guess < secret_number
	  	puts "Too Low!"
	  	count += 1
	  end

	  if count > max_guesses
	  	puts "You lost! The secret number was: #{secret_number}."
	  	break
	  end
	end
end

intro
player = get_name
display_rules(player, min_num, max_num, max_guesses)
the_game(count, min_num, max_num, max_guesses, secret_number)



