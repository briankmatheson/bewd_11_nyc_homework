Rails.application.routes.draw do
  root 'games#index'
  get '/games' => "games#index"
  
  resources :secret_numbers, :only => [:new, :show]
  get '/secret_numbers', to: 'secret_numbers#new'

  resources :rock_paper_scissors, :only => [:new, :show]
  get '/rock_paper_scissors', to: 'rock_paper_scissors#new'

  end
