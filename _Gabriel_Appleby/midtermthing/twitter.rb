require 'oauth'
require 'JSON'
require_relative 'TwitterUser'
#Gabriel Appleby

##Test Account
##Screen_name = testbewd
##Pass = bewdtest


## To fix when making into rails app
    #Retweet broke.
    #Super messsy
        #but at least no input/output in twitteruser object
    #Error handling
        #Tweets that are too long etc
        #Accessing elements out of bounds in arrays
    #4 menue paths
        #Get-Tweets
            #Retweet
        #Get-Direct Messages
        #Get-Following
        #Get-Followers
    #From each path 
        #(relevant user means i should be able to select them by the tweet/dm they authored
        #or from the list of followers)
        #Post-Send a tweet to relevant user
        #Post-Send a direct message to relevant user
        #Post-Follow/unfollow relevant user
        #Post-Favorite/unfavorite relevant post
    #Auth without pin, should be easy w/ callback url
    #Be less greedy with calls to the api, hitting rate limit quite quickly



def get_access_token()
    bool_debugging = false
    
    ##Blah blah internet illuminati will steal my info
    ##blah blah
    consumer_key = OAuth::Consumer.new(
    "1Cf8qYr5WpGpDDgMyV9XILAYi",
    "svXHxaer7qm2PrmvcvQXQvMa77twLy9NnlFFuMFI2VQru5jzsu", {
        site: "https://api.twitter.com", 
        request_token_path: "/oauth/request_token", 
        access_token_path: "/oauth/access_token", 
        authorize_path: "/oauth/authorize"})
    
    
    if bool_debugging == true
        access_token = OAuth::Token.new(
        "INSERT_HERE",
        "INSERT_HERE")

        string_baseurl = "https://api.twitter.com"
        string_path = "/1.1/statuses/home_timeline.json"
        string_address = URI("#{string_baseurl}#{string_path}")

        http = Net::HTTP.new address.host, address.port
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER

        request = Net::HTTP::Get.new address.request_uri
        request.oauth! http, consumer_key, access_token
        response = http.request request
        array_twitter_JSON = JSON.parse(response.body)
        array_twitter_JSON.each do |tweet|
            puts "#{tweet["user"]["screen_name"]}:\n#{tweet["text"]} \n\n" 
        end
    else 
        request_token = consumer_key.get_request_token()
        puts request_token.authorize_url
        int_code = gets.chomp.to_i
        access_token = request_token.get_access_token(:oauth_verifier => int_code)
    end
    return access_token
end

def tweets(user) 
    int_i = 0
    user.tweets.each do |tweet|
        puts "#{int_i}: #{tweet["user"]["screen_name"]}:\n#{tweet["text"]} \n\n"
        int_i += 1
    end
    bool_j = true
    while bool_j == true
        puts "What would you like to do to which tweet?"
        puts "0: Favorite"
        puts "1: Retweet"
        puts "2: Reply"
        puts "3: Exit"
        puts "Would would you like to do?"
        int_option = gets.chomp.to_i
        if int_option != 3 
            puts "Which tweet?(0-19)"
            int_tweet = gets.chomp.to_i
        end
        if int_option == 0
            user.favorite(user.tweets[int_tweet]["id_str"])
        elsif int_option == 1
            user.retweet(user.tweets[int_tweet]["id_str"])
        elsif int_option == 2
            puts "What would you like to reply with?"
            user.reply(gets.chomp, user.tweets[int_tweet]["id_str"])
        elsif int_option == 3
            bool_j = false
        else
            puts "Invalid input, try again."
        end
    end
end

def direct_messages(user)
    int_i = 0
    user.direct_messages.each do |direct_message|
        puts "#{int_i}: #{direct_message["sender_screen_name"]}:\n#{direct_message["text"]} \n\n"
        int_i += 1
    end
    bool_j = true
    while bool_j == true
        int_selection = 9
        puts "Options"
        puts "0: Reply to a direct message"
        puts "1: Exit"
        puts "What would you like to do?"
        int_option = gets.chomp.to_i
        if int_option != 1
            puts "To which message? (0-19)"
            int_direct_message = gets.chomp.to_i
            screen_name = user.direct_messages[int_direct_message]["sender_screen_name"]
        end
        if int_option == 0
            send_dmG(user, screen_name)
        elsif int_option == 1
            bool_j = false
        else
            puts "Incorrect input"
        end
    end
end

def send_tweet(user)
    puts "What would you like to say?"
    tweet = gets.chomp
    user.send_tweet(tweet)
end

def send_dm(user)
    puts "What is the screen name of who you want to message?"
    screen_name = gets.chomp
    puts "What would you like to say?"
    text = gets.chomp
    user.send_direct_message(text, screen_name)
end

def send_dmG(user, screen_name)
    puts "What would you like to say?"
    text = gets.chomp
    user.send_direct_message(text, screen_name)
end

def twitter_main()
    puts "Please copy and paste this url into your web browser."
    user = TwitterUser.new(get_access_token)
    bool_i = true
    while bool_i == true
        int_selection = 9
        puts "What would you like to do"
        puts "0: Read some tweets"
        puts "1: Read your direct messages"
        puts "2: Tweet something"
        puts "3: Send direct message"
        puts "4: Exit"
        int_selection = gets.chomp.to_i
        if int_selection == 0
            tweets(user)
        elsif int_selection == 1
            direct_messages(user)
        elsif int_selection == 2
            send_tweet(user)
        elsif int_selection == 3
            send_dm(user)
        elsif int_selection == 4
            bool_i = false
        else
            puts "Invalid input, try again."
        end
    end
end
def starting_options() 
    puts "Welcome to consoleTwitter \nWould you like to continue?(y/n)"
    string_response = gets.chomp
    if string_response.downcase == "y" 
        twitter_main()
    end  
end

starting_options() 