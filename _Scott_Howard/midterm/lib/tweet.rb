#Tweet class.
class Tweet
	attr_accessor :author, :followers_count, :place, :text

	def initialize (author, followers_count, place, text)
		@author = author
		@followers_count = followers_count
		@place = place
		@text = text
	end

	def to_s	
		if @place == null
			temp_place = "I'd rather not say"
		else
			temp_place = @place
		end

		"#{@author} said: #{@text}. He/she wrote tweet #{id} from #{temp_place}"
	end
end