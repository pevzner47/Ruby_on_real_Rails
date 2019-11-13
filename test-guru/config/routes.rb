Rails.application.routes.draw do

  root to: 'tests#index'

  resources :tests

  get '/tests/:category/:title', to: 'tests#search'
  #
  # resource :account

  #match 'test/:id', to: 'tests#create', via: :all

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
