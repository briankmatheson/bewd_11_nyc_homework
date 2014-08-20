class RockPaperScissorsController < ApplicationController
  def new
    @secret_number = rand(3)
    @choices = choices
  end

  def show
    secret_number = rand(3)
    @choices = choices
    @secret_guess = @choices[secret_number]
    @chosen_guess = params[:id]

    @won = false

    if @secret_guess == @chosen_guess
      @msg = "Tie Game!"
    elsif (@secret_guess == "rock" && @chosen_guess == "scissors") ||
      (@secret_guess == "scissors" && @chosen_guess == "paper" ) ||
      (@secret_guess == "paper" && @chosen_guess == "rock")
      @msg = "You lose"
    else
      @msg = "You win"
    end
  end

  private
  def choices
  	choices = [ "rock", "paper", "scissors" ]
  end

end
