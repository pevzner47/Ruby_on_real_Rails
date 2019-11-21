Rails.application.routes.draw do

  root to: 'tests#index'

  resources :tests do
    resources :questions, except: :index, shallow: true
  end

  get '/tests/:category/:title', to: 'tests#search'
end
