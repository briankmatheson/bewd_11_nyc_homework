class RockPaperScissorsController < ApplicationController
  def new
  	@throws = Array.new

  	@throws = ["rock", "paper", "scissors"]

	  @comp_throw = rand(2) + 1 

	  @comp_result = @throws[@comp_throw + 1]


  end

  def show

  	@throws = Array.new

  	@throws = ["rock", "paper", "scissors"]
  	
    @comp_throw = rand(2) + 1  
    @comp_result = @throws[@comp_throw + 1]


    @player_throw = params[:id].to_s


    @won = false

  	RULES = {
  	  :rock     => {:rock => :draw, :paper => :paper, :scissors => :rock},
  	  :paper    => {:rock => :paper, :paper => :draw, :scissors => :scissors},
  	  :scissors => {:rock => :rock, :paper => :scissors, :scissors => :draw}
  	}

  	def play(p1, p2)
  	  RULES[p1][p2]
  	end    

    play(@comp_result, @player_throw)

    # if @comp_result == @player_throw
    #   @won = true
    #   @msg = "Dyno-mite!"
    # else
    #   @msg = "wah wah"
    # end
  end	
end
