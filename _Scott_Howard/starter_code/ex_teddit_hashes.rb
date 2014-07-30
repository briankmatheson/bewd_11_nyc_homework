# Step 1: Working with Arrays and Hashes

# Copy your solution from conditional_teddit.rb. 
# Create an empty stories array. This will be used to hold all stories we capture.
# Users enter the story as they do now, but it gets put in a hash instead. 
# Update any reference to the story (upvotes, category and title) 
# Your story hash should look like the one below: 
# { title: "Monkeys thank mayor for flounder tooth necklace", category: "Teeth", upvotes: 1 }
# Add the hash to an array called stories and print "Story: Monkeys thank mayor for flounder tooth necklace, Category: (Teeth), Current Upvotes: 1"
# Using the stories array 
# Test your cat, bacon, and food upvote conditional logic.
#
# Step 2: Adding Loops 
# Use a loop, so that your program continues to ask a user for stories until they chose to quit. ("Would you like to add another story? Enter 'y' or 'n'")
# Once the user is finished with entering their stories, use .each to print each story in the stories array. 
#
#
# Teddit Conditionals - Starter Code.

# Let's add a new Teddit feature. Upvotes!
# Complete the application below. 
# Where you see comments (lines that begin with #) replace it with code so that the program works.

def get_input
  #Get input from the user.
  gets.chomp
end

def calculate_upvotes(story, category)
  upvotes = 1
	# Write code so that:
  if category == 'Cats' 
    # If the Story is about cats multiply the upvotes by 5
    return upvotes * 5
  elsif category == 'Bacon'
    # If the Story is about bacon multiply the upvotes by 8
    return upvotes * 8
  elsif category == "Food" # notice the lower case (see what happens when you enter a category with an upper case 'Food')
	 # If the Story is about Food it gets 3 times the upvotes.
   return upvotes * 3
  else 
    return upvotes
  end
end

def display_all(stories)
  
  # Displays a summary count of the stories in the array
  puts "We have a total of #{stories.count} stories"
  puts "--------------"
  # Displays a header for the article grid
  puts ""
  puts " # | ARTICLE                              | CATEGORY         | UPVOTES"
  puts "---|--------------------------------------|------------------|--------"

  count = 1
  # Loops through the stories array and prints out using a template fitting the grid
  stories.each do |story_item|
      printf("%2s | %33s ...| %16s |   %s", "#{count}", "#{story_item[:title][0..32]}", "#{story_item[:category][0..10]}","#{story_item[:upvotes]}\n")
      count += 1
  end

end

stories = Array.new
article = Hash.new 

puts "------------------------------------------------------------------------------"
puts "| Welcome to Teddit! a text based news aggregator. Get today's news tomorrow |"
puts "------------------------------------------------------------------------------"
puts ""

loop do # Loop controls input of new articles

  puts "Would you like to add another story? Enter 'y' or 'n'"
  more_input = get_input.capitalize
  break if more_input != "Y"
  
  # if the user inputs "y" to add an additional story, prompts and captures
  puts "Please enter a News story:"
  story = get_input
  puts "Please give it a category:"
  category = get_input.capitalize
  upvotes = calculate_upvotes(story, category)

  # creates an instance of the article hash
  article = {title: story, category: category, upvotes: upvotes}
  # adds the hash to the stories array
  stories << article
  puts "New story added! #{article[:title]}, Category: (#{article[:category].capitalize}), Current Upvotes: #{article[:upvotes]}"

end # end input loop


display_all(stories)

