class Trends
  attr_accessor :name, :query_trend, :promoted_content ## 3 variables that come with Twitter Trends info

  def initialize ## initializing 3 variables that come with Twitter Trends info. Am I doing something wrong?
    @name= nil
    @query_trend= nil
    @promoted_content= nil
  end

  def create ## trying to create the Trends objects via iteration. $tweets is the json.parse from the connection. "tr" means the user selected trends
     if $decision =="tr"
      puts "Here are the Trends you requested!"
      @count= 0
      $tweets[0]["trends"].each do |tweet|
        @name= tweet["name"]
        @query_trend= tweet["query"]
        @promoted_content= tweet["promoted_content"]
        @count +=1
        to_s
      end
    end
  end

    def to_s
    puts "#{@count}. Trend: #{@name} | query: #{@query_trend} | promoted content:#{@promoted_content}"
  end

end

