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



def get_input
  #Get input from the user.
  return gets.chomp
end

def calculate_upvotes(story)
  upvotes = story[:upvotes]
  category = story[:category]
  puts "category is #{category}"
  # Write code so that:
  if category == 'cats' 
    # If the Story is about cats multiply the upvotes by 5
    return upvotes * 5
  elsif category == 'bacon'
    # If the Story is about bacon multiply the upvotes by 8
    return upvotes * 8
  elsif category == "food" # notice the lower case (see what happens when you enter a category with an upper case 'Food')
   # If the Story is about Food it gets 3 times the upvotes.
   puts "am I here?"
   return upvotes * 3
  else 
    return upvotes
  end
  #For example:
  # "Cats frolic despite tuna shortage" should give you 5 times the upvotes!
end

def build_story(story, category)
  {story: story, category: category, upvotes: 1} # popular ruby shorthand, since ruby always returns the last line of the funciton, its fairly popular to just put the expression of what you want to return.
end

def get_story
  puts "Please enter a News story:"
  s = get_input
  puts "Please give it a category:"
  c = get_input
  return build_story(s, c) ## notice the same ruby shorthand of returing the last line. 
end

stories = Array.new

puts "Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!"

continue = 'y'

while continue.downcase == 'y' ## use downcase incase user entered with an upcase letter.
  stories << get_story
  puts "Would you like to add another story (y or n): "
  continue = get_input
end

stories.each do |story|
  upvotes = calculate_upvotes(story)
  puts "New story added! #{story[:story]}, Category: #{story[:category].capitalize}, Current Upvotes: #{upvotes}"
end
#