# #![GeneralAssemb.ly](https://github.com/generalassembly/ga-ruby-on-rails-for-devs/raw/master/images/ga.png "GeneralAssemb.ly")

# Back-End Web Development
# --------

# ##MIDTERM  REQUIREMENTS

# Create a command line based application that fulfills these criteria:

# -  Takes user input and handles bad input (i.e. You expect numbers and they give you a letter).
# -	Connects to a 3rd party api where the call varies based on what the user gives you.
# -	Must be object oriented. You must instantiate modeled classes. The only file that can run without classes is your runner.
# -	Push code on Github.


# ##GRADING
# Your midterm is considered completed if it meets all requirements above. Your instructor and T.A will provide you with feedback.

# #client = Twitter::REST::Client.new do |config|
#   config.consumer_key    = OerU09ehRUZ5KOXMRPj2BOHh6
#   config.consumer_secret = KaOIq8Y8xLAIM51AZLJCK1E1Zs5d4uZAl1KFxxN8oRvKxlwMG9
# end

# ## grab from twitter
# twitter_client = RestClient.get('https://api.twitter.com/1.1/search/tweets.json?q=%40twitterapi')
# twitter_json = JSON.load(twitter_client)
# puts twitter_json

# API Ideas: 

# *	omdapi.com
# *	Twitter search api

require 'json'
#require 'rest-client'
require 'twitter'
require 'TweetStream'

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "OerU09ehRUZ5KOXMRPj2BOHh6"
  config.consumer_secret     = "KaOIq8Y8xLAIM51AZLJCK1E1Zs5d4uZAl1KFxxN8oRvKxlwMG9"
  config.access_token        = "292110213-3P0uHIyz9q25mOKTaI4G48Jzv7xoR7GKI5pt8hVA"
  config.access_token_secret = "BI639AC1vn74tlguEdilmP7lWXlTOxsh1WXEDYjy7AP7W"

end

# TweetStream.configure do |config|
#   config.consumer_key       = "OerU09ehRUZ5KOXMRPj2BOHh6"
#   config.consumer_secret    = "KaOIq8Y8xLAIM51AZLJCK1E1Zs5d4uZAl1KFxxN8oRvKxlwMG9"
#   config.oauth_token        = "292110213-3P0uHIyz9q25mOKTaI4G48Jzv7xoR7GKI5pt8hVA"
#   config.oauth_token_secret = "BI639AC1vn74tlguEdilmP7lWXlTOxsh1WXEDYjy7AP7W"
#   config.auth_method        = :oauth
# end

# @statuses = []
# TweetStream::Client.new.sample do |status, client|
#   @statuses << status.text
#   client.stop if @statuses.size >= 10
# end

#puts @statuses

full_text=[]

while full_text
client.filter(:locations => "-122.75,36.8,-121.75,37.8") do |tweet,count|
	puts @count
	  	@count<< tweet.text
 	end
 end
 puts @count

# MAX_ATTEMPTS = 3
# num_attempts = 0
# follower_ids = client.follower_ids
# begin
#   num_attempts += 1
#   follower_ids.to_a
# rescue Twitter::Error::TooManyRequests => error
#   if num_attempts <= MAX_ATTEMPTS
#     # NOTE: Your process could go to sleep for up to 15 minutes but if you
#     # retry any sooner, it will almost certainly fail with the same exception.
#     sleep error.rate_limit.reset_in
#     retry
#   else
#     raise
#   end
# end



#MAX_TWEETS_PER_REQUEST = 10


# client.sample do |object|
# 	puts object.attrs if object.is_a?(Twitter::Tweet)
# 	count+=1
# 	if count >= 100 then exit end

# end

# def count_words(string)
#   words = string.split(' ')
#   frequency = Hash.new(0)
#   words.each { |word| frequency[word.downcase] += 1 }
#   return frequency
# end

# client.search("cat", :result_type=>"recent").take(3).each do |tweet|
#   full_tweet<< tweet.text.split(' ')

# end


# client.filter(:locations => "-122.75,36.8,-121.75,37.8") do |tweet|
# 	if full_tweet.count<10
# 		puts full_tweet.count
# 	  	full_tweet<< tweet.text
# 	end
# 	puts full_tweet
#  end

# client.search("to:*").take(10).each do |object|
# 	puts object.text
# end

