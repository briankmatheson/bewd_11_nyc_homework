#Query class
class Question
	attr_accessor :query_term, :query_return_count, :tweets

	def initialize (query_term, query_return_count)
		@query_term = query_term
		@query_return_count = query_return_count
		@tweets = []
	end

	def view_tweets
		count = 1
		puts ""
		puts "-------------#{query_term} results ------------"
		@tweets.each do |tweet|
			puts "#{count}. #{tweet.author}(From: #{tweet.place} with #{tweet.followers_count} followers) said\" #{tweet.text}\""
			puts ""
			puts "---"
			count += 1
		end
	end
end
