Rails.application.routes.draw do
  root 'welcome#index'

  resources :companies do
    member do
      post 'follow'
    end
    member do
      post 'unfollow'
    end
  end

  resources :users
  # Sessions
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
