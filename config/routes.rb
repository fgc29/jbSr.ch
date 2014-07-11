Rails.application.routes.draw do
  root 'welcome#index'

  resources :companies
  resources :users
  # Sessions
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
