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

    # resources :search, only: [:index]
    get '/search', :to => 'search#index'
  end

  
  root: 'categories#index'
end
