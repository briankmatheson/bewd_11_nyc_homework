require_relative 'lib/teams'


require 'json'
require 'rest-client'

# model api call for ESPN
 # http://api.espn.com/:version/:resource/:method?apikey=:yourkey


#FiFA World Cup teams call
espn_client = RestClient.get('http://api.espn.com/v1/sports/soccer/fifa.world/teams?apikey=6rm42hyheg2795t9tpgrymmw')
espn_json = JSON.load(espn_client)


@all_teams = Array.new
@all_teams_key = Array.new
@storage = {}

#calls world cup teams & adds to storage hash
espn_json["sports"].each do |x|
	x["leagues"].each do |y|
		y["teams"].each do |z|
			team_name = z["name"]
			team_id = z["id"]
			temp = Teams.new(team_name,team_id)
			@storage[temp.name_to_s.downcase] = temp.id_to_s
end
end
end

#defining an array so the check_news function will work
@news_array = Array.new



#define methods for program

#this gets the team specific news
def get_news
	@espn_json_2 = JSON.load(RestClient.get("http://api.espn.com/v1/sports/soccer/fifa.world/teams/#{@storage[@user_input]}/news?apikey=6rm42hyheg2795t9tpgrymmw"))
	@espn_json_2["headlines"].each do |x|
		if x["secondaryDescription"] == nil
				puts x["headline"]
			else
				puts x["headline"]	
				puts "     " + x["secondaryDescription"]
				puts ""
			end
		@news_array << x["headline"]
	end
end

#this checks if there is team specific news and returns general FIFA news if there is not
def check_news
	if @news_array.empty?
		puts "Sorry! It doesn't look like there is any news available for that team.\nHere's some general FIFA news:"
		@espn_json_3 = JSON.load(RestClient.get("http://api.espn.com/v1/sports/soccer/fifa.world/news?apikey=6rm42hyheg2795t9tpgrymmw"))
			@espn_json_3["headlines"].each do |x|
			if x["secondaryDescription"] == nil
				puts x["headline"]
			else
				puts x["headline"]	
				puts "     " + x["secondaryDescription"]
				puts ""
			end
		end
end
end

#Checks if the user input is an actual World Cup team and prompts the user for a real team if it's not
def check_user_input
	loop do 
		break if @storage.has_key?(@user_input)
		puts "Sorry! It looks like that team is not in the World Cup. Please enter a valid team name."
		@user_input = gets.chomp.downcase
	end 
end


#Runs the program
puts "Welcome to the World Cup News Finder!"
puts "What team do you want to find news about?"
@user_input = gets.chomp.downcase
check_user_input
get_news
check_news


