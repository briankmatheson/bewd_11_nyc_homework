

class TwitterUser
    require 'oauth'
    require 'json'
    
    attr_reader :name, :screen_name
    
    def initialize(access_token)
        @access_token = access_token
        @user = JSON.parse(access_token.get("/account/veryify_credentials.json").body)
        name = @user["name"]
        screen_name = @user["screen_name"]
    end
    
    def tweets()
        return JSON.parse(@access_token.get("/1.1/statuses/home_timeline.json").body)
    end
    
    def reply(reply, tweet_id)
        @access_token.post("/1.1/statuses/update.json", {status: reply, in_reply_to_status_id: tweet_id})
    end
   #Doesn't work for unknown reasons...
    def retweet(tweet_id)
        @access_token.post("/1.1/statuses/retweet/:#{tweet_id}.json", {id: tweet_id.to_i})
    end
   
    def favorite(tweet_id)
        @access_token.post("/1.1/favorites/create.json", {id: tweet_id}) 
    end
    
    def send_tweet(tweet)
        @access_token.post("/1.1/statuses/update.json", {status: tweet})
    end
    
    def direct_messages()
        return JSON.parse(@access_token.get("/1.1/direct_messages.json").body)
    end
    
    def send_direct_message(direct_message, user_screenname)
        @access_token.post("/1.1/direct_messages/new.json", {text: direct_message, screen_name: user_screenname})
    end
end