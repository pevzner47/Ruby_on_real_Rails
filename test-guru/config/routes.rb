Rails.application.routes.draw do

  root to: 'tests#index'

  resources :tests do
    resources :questions, only: [:show, :create, :new, :destroy, :edit, :update], shallow: true
  end

  get '/tests/:category/:title', to: 'tests#search'
end
