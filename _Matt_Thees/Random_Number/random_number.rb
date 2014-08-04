# random number game - user has to guess a random number between 1 and 9 and the
# game must tell them if they are right or wrong

def check_number (number, guesses_left)
  # while loop tells runs the program until you guess correctly
  while guesses_left > 0 do

    puts "Enter a guess:"

    # get new input if previous input is incorrect
    input = gets.chomp.to_i

    if input != number

      if input > number
        puts "Too High!"
      elsif input < number
        puts "Too Low!"
      end

      guesses_left -= 1
      puts "You have #{guesses_left} guess(es) remaining."

    elsif input == number
      puts "YOU GOT IT!!"
      guesses_left = 0

    end # input != number

  end # guesses_left > 0

  if guesses_left == 0 && input != number
    puts "Booo! The number was #{number}, thanks for playing."
  end

  puts "Game Over."
end # check_number

puts "Random Number Game! Guess a number between 1 and 10. You have only 3 guesses to guess the correct number."

# create array of numbers for program to sample
number_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# program chooses the number
number = number_array.sample
# guesses
guesses_left = 3

check_number(number, guesses_left)