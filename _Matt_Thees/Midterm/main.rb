
require_relative 'lib/user.rb'
require 'twitter'


@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "j2Sh5MnHi1sVzBwT0ikERg"
  config.consumer_secret     = "ZMpnUbhVSPG6XIK70AjQTCWUKZEmjw5FoAKDHSWpnKw"
  config.access_token        = "49870206-AwX04iLOxftwpF2vZl6wJLY7spyB4ciS27YRDWiMn"
  config.access_token_secret = "EkA6XifdKUWTmbo1748xjRatmQU9AQyoJVu1mGZeHCX56"
end


#===============================================================================
#===============================================================================



def search_hashtags(hashtag)
  @client.search("##{hashtag} -rt", :result_type => "recent").take(10).collect do |tweet|
    puts "@#{tweet.user.screen_name}-- #{tweet.text}"
    puts "--------"
  end
  puts "Those are the 10 most recent tweets with the hashtag '#{hashtag}'!"
end

def search_for_user_mentions(user)
  @client.search("#{user} -rt", :result_type => "all").take(10).collect do |tweet|
    puts "@#{tweet.user.screen_name}-- #{tweet.text}"
    puts "--------"
  end
end

def search_setup
  puts "--- Okay #{@user_name} ---"
  puts "Let's search twitter!"
  puts "What would you like to search for?"
  puts "type 'h' for Hashtags, or"
  puts "type 'u' for User Mentions"
  search_type = gets.chomp.downcase

  if search_type == "h"
    puts "--------"
    puts "Enter a search without the '#' symbol and without spaces or punctuation."
    puts "--------"
    hashtag_search = gets.chomp.downcase
    puts "================="
    # run function with (hashtag_search)
    search_hashtags(hashtag_search)

  elsif search_type == "u"
    puts "--------"
    puts "Enter a Twitter Handle with the '@' symbol included."
    puts "--------"
    user_search = gets.chomp.downcase
    puts "================="
    # run function with (user_search)
    search_for_user_mentions(user_search)
  else
    puts "You have entered an incorrect search type, return to main menu? (y/n)"
  end

end


def start_app_create_user
  puts "Hello User, whats your name?"
  @user_name = gets.chomp
  User.new(@user_name)

  puts "======================"
  puts "Hey there #{@user_name}!"
  puts "======================"
  puts "What do you want to do today?"
  puts "Enter 's' to search Twitter, or"
  puts "Enter 'q' to quit."
  action = gets.chomp

  if action == "s"
    search_setup
  elsif action == "q"
    puts "Have a nice day, #{user_name}"
  else
    puts "Looks like you've entered a bad command. Sorry, try again next time."
  end
end

start_app_create_user