
#Intro + User Name

def welcome
	puts "Hi, welcome to the Secret Number Guessing Game by Aditi. I am going to pick a number between 1 - 10. You'll have 3 chances to guess which number I picked. Let's get started!"
	puts "What's your name? "
	name = gets.chomp
	print "Hi " + name + ", here goes nothing! "
end


#User Inputs Guess

welcome

secret_number = 6 #to change secret_number; do it here

2.downto(0) do |number_of_guesses|
	puts "What's your guess? "
	guess = gets.chomp.to_i
	print "Hmmm..."

	if guess > secret_number
		puts "You're guessing high!"

	elsif guess < secret_number
		puts "You're too low.."

	else
		puts "You guessed right! Thank you for playing."
		exit
	end

    puts "You have #{number_of_guesses} guesses left" #reminds users how many guesses are left
end

puts "Sorry, you didn't win! The secret number was #{secret_number}."