Rails.application.routes.draw do

    devise_for :users

    #messages 
    resources :conversations do
      resources :messages
    end

    #users
    get 'users/:id' => 'users#show'
    resources :users, only: [:show] do
      resources :reviews
    end

    #posts & resource tags
    resources :posts do
      resources :transactions
    end

    #tags 
    resources :tags, only: [:create, :destroy]
    
    #post tags
    resources :post_tags, only: [:create, :destroy]

    #categories 
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
