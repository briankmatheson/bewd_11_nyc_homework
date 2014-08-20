Rails.application.routes.draw do
  root "home#index"
  resources :urls, only: [:new, :create, :show] #restrict this to just :create, :new and :show

  get '/:code', to: 'urls#redirectors'
  get '/:code/preview', to: 'urls#preview'

end
