class Tweets
  attr_accessor :id, :text, :location, :followers_count ## 4 variables that I want to use from the Tweets json

  def initialize ## initializing my 4 variables
    @id= nil
    @text= nil
    @location= nil
    @followers_count= nil
  end

def create ## trying to create the Tweets objects via iteration. $tweets is the json.parse from the connection. "t" means the user selected trends
  if $decision=="t"
    puts "Here are the Tweets you requested!"
    @count=0
      $tweets["statuses"].each do |tweet|
      @id= tweet["user"]["screen_name"]
      @text=tweet["text"]
      @location= tweet["user"]["location"]
      @followers_count= tweet["user"]["followers_count"]
      #binding.pry
      @count +=1
      to_s
    end
  end
end

def to_s
    puts "#{@count}. ID: #{@id} | TEXT: #{@text} | LOCATION:#{@location} | FOLLOWERS:#{@followers_count}"
  end

end