require 'json'
require 'rest-client'
require 'twitter'
require 'TweetStream'

# # ## grab from twitter
# twitter_client = RestClient.get('https://api.twitter.com/1.1/trends/place.json?id=1')
# twitter_json = JSON.load(twitter_client)
# puts twitter_json

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "OerU09ehRUZ5KOXMRPj2BOHh6"
  config.consumer_secret     = "KaOIq8Y8xLAIM51AZLJCK1E1Zs5d4uZAl1KFxxN8oRvKxlwMG9"
  config.access_token        = "292110213-3P0uHIyz9q25mOKTaI4G48Jzv7xoR7GKI5pt8hVA"
  config.access_token_secret = "BI639AC1vn74tlguEdilmP7lWXlTOxsh1WXEDYjy7AP7W"

end


#trending = []
		@client.trends(id = 1).each do |simple|
		puts simple[:trends]
	end

		#[0][1].each do |names|
		 	# puts "#{@count} #{names[:name]}"
		 	# @count +=1