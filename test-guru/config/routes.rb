Rails.application.routes.draw do

  root to: 'tests#index'

  resources :tests do
    resources :questions, except: :index, shallow: true do
      resources :answers, except: :index, shallow: true
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  get '/tests/:category/:title', to: 'tests#search'
end
