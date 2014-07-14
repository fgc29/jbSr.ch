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
  #investor route class defined under Company
  get '/investors' => 'investors#index'
  get '/investor/:id' => 'investors#show', as: :investor
  post '/investors/:id/follow' => 'investors#follow'
  post '/investors/:id/unfollow' => 'investors#unfollow'

  resources :users
  # Sessions
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
