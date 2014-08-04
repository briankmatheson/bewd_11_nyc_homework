require 'rubygems'
require 'oauth'
require 'json'
require 'pry'

require_relative 'lib/tweets'
require_relative 'lib/trends'
require_relative 'lib/connection'
require_relative 'lib/wordcloud'

### This is the entire program
puts "Would you like to see the tweet trends (tr) worldwide , the latest tweets (t) based on your favorite keyword, or a word cloud (w) for a specific location?"
connection_open= Connection.new(gets.chomp) ##starts
connection_open.type ## tweets or trends url path and input variables such as keyword/counts
connection_open.configure ## connect to twitter api

#### Testing Trends Class
test= Trends.new
test.create

### Testing Tweets Class

test2= Tweets.new
test2.create

### testing wordcloud.

a= Cloudy.new
a.cloud