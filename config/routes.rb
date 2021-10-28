Rails.application.routes.draw do
  root to: 'static#home'
  get 'static/home'

  # User routes
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
