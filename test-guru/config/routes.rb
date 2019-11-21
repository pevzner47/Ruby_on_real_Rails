Rails.application.routes.draw do

  root to: 'tests#index'

  resources :tests do
    resources :questions, except: :index, shallow: true do
      resources :answers, shallow: true
    end
  end

  get '/tests/:category/:title', to: 'tests#search'
end
