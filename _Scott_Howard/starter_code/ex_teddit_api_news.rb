# We're going to add a remote data source to pull in stories from Mashable and Digg.
  # http://mashable.com/stories.json
  # http://digg.com/api/news/popular.json
# These stories will also be upvoted based on our rules. No more user input!

# Pull the json, parse it and then make a new story hash out of each story(Title, Category, Upvotes)
# Add each story to an array and display your "Front page"

require 'json'
require 'rest-client'

# grab from mashable (client getting info)
mash_client = RestClient.get("http://mashable.com/stories.json")
#parse that info
mash_json = JSON.load(mash_client)

#grab from digg
digg_client = RestClient.get("http://digg.com/api/news/popular.json")
digg_json = JSON.load(digg_client)


def get_input
  #Get input from the user.
  return gets.chomp
end

def calculate_upvotes(category)
  upvotes = 1
  c = category
  # Write code so that:
  if c.capitalize == 'Cats' 
    # If the Story is about cats multiply the upvotes by 5
    return upvotes * 5
  elsif c.capitalize == 'Bacon'
    # If the Story is about bacon multiply the upvotes by 8
    return upvotes * 8
  elsif c.capitalize == "Food" # notice the lower case (see what happens when you enter a category with an upper case 'Food')
   # If the Story is about Food it gets 3 times the upvotes.
   return upvotes * 3
  elsif c.capitalize == "Nature"
	return upvotes * 7
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

def display_all(stories)
  ## Displays a summary count of the stories in the array
  puts "We have a total of #{stories.count} stories"
  puts "--------------"
  ## Displays a header for the article grid
  puts ""
  puts " # | ARTICLE                              | CATEGORY         | UPVOTES"
  puts "---|--------------------------------------|------------------|--------"

  count = 1
  ## Loops through the stories array and prints out using a template fitting the grid
  stories.each do |story_item|
      printf("%2s | %33s ...| %16s |   %s", "#{count}", "#{story_item[:title][0..32]}", "#{story_item[:category][0..10]}","#{story_item[:upvotes]}\n")
      count += 1
  end
end

stories = Array.new

puts "Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!"


story_num = 0 ## counter to work through array items

mash_json["new"].each do
  story = mash_json["new"][story_num]["title"]
  category = mash_json["new"][story_num]["channel"]
  upvotes = calculate_upvotes(category)
  stories << {title: story, category: category, upvotes: upvotes}
  story_num += 1
end

story_num = 0 ## counter to work through array items

digg_json["data"]["feed"].each do
	story = digg_json["data"]["feed"][story_num]["content"]["title_alt"]
	category = digg_json["data"]["feed"][story_num]["content"]["tags"].first["display"]
	upvotes = calculate_upvotes(category)
	stories << {title: story, category: category, upvotes: upvotes}
	story_num += 1
end

display_all(stories)


########### Not used anymore ##############
# continue = 'y'
# while continue.downcase == 'y' ## use downcase incase user entered with an upcase letter.
#   stories << get_story
#   puts "Would you like to add another story (y or n): "
#   continue = get_input
# end

# stories.each do |story|
#   upvotes = calculate_upvotes(story)
#   puts "New story added! #{story[:story]}, Category: #{story[:category].capitalize}, Current Upvotes: #{upvotes}"
# end
