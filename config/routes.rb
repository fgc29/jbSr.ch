Rails.application.routes.draw do

  resources :companies
  resources :users
  # Sessions
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
