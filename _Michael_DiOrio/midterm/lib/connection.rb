class connection
	def initialize ()


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


class GA_course
        def initialize (course_name)
            @course_name = course_name
        end

        def announce_course
            puts "GA has a course on #{@course_name}"
        end
    end

    my_course = GA_course.new("BEWD")
    other_course = GA_course.new("UXD")

    my_course.announce_course
    other_course.announce_course