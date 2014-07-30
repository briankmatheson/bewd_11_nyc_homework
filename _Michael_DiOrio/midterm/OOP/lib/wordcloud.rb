class Cloudy
	 attr_accessor :text

def initialize
	@text = nil
end

def cloud
	if $decision=="w"
	    @tweet_array = []
		  $tweets["statuses"].each do |tweet|
		  @text=tweet["text"]
		  @tweet_array << @text
		  end
	else
	end
	if $decision=="w"
		puts "Here is your word cloud!"
		words= @tweet_array.join(" ")
		#puts @tweet_array
		words2= words.split(" ")
		frequencies= Hash.new(0)
		words2.each { |word| frequencies[word] +=1 }
		frequencies = frequencies.sort_by {|word, count| count }
		frequencies.reverse!
		frequencies.each do |name, count|
			if count >8
   			puts name + " " + count.to_s
   		end
   	end
	end

end
end