Rails.application.routes.draw do

    devise_for :users

    resources :users do
      resources :reviews
    end 

    resources :conversations do
      resources :messages
    end

    resources :posts do
      resources :transactions
      resources :tags
    end

    resources :categories, only: [:index, :show] do
      resources :posts, only: [:index, :show]
    end

    #Sessions routes
    resources :sessions, only: [:create, :new]
    delete 'sessions', to: 'sessions#logout'

    # resources :search, only: [:index]
    get '/search', :to => 'search#index'
  

  
  root to: 'categories#index'
end
