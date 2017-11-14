Rails.application.routes.draw do

  devise_for :users

    resources :conversations do
      resources :messages
    end
    

    get 'users/:id' => 'users#show'
    resources :users, only: [:show] do
      resources :reviews
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
