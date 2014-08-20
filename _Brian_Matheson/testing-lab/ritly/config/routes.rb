Ritly::Application.routes.draw do
  root "home#index"

  resources :urls, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]

  get '/logout', to: "sessions#destroy"

  get '/:code', to: 'urls#redirector'
  get '/:code/preview', to: 'urls#preview'
end
