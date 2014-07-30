secret_number = 1

def user_input
	gets
end

def IsguessCorrect(guess)
	if guess == 1
		return answer = 'YES'
	else 
		return answer = 'NO'
	end
			
end

count = 3 
while count>0
	puts "You have #{count} time(s) to guess..."
	puts "Please take you guess at my secret_number"
	guess = gets
	answer = IsguessCorrect(guess.to_i)
	puts "is your guess correct? #{answer}"
	if answer == 'YES'
		break
	end
	count = count - 1 
end