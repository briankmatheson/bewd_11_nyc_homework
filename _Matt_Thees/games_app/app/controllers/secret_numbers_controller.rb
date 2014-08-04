class SecretNumbersController < ApplicationController
  def new
    @secret_number = rand(5) + 1

  end

  def show
    @secret_number = rand(5) + 1
    @chosen_number = params[:id].to_i

    if @secret_number == @chosen_number
      @msg = "YOU WIN!"
    else
      @msg = "You Lose!"
    end
  end
end
