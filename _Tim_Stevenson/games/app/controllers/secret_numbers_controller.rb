class SecretNumbersController < ApplicationController
  def new
    @secret_number = rand(5) + 1 
  end

  def show
    @secret_number = rand(5) + 1  
    @chosen_number = params[:id].to_i

    @won = false

    if @secret_number == @chosen_number
      @won = true
      @msg = "You did it! You win!"
    else
      @msg = "Man you suck."
    end
  end
end
