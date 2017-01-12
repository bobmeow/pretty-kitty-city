Rails.application.routes.draw do

  resources :friendships
  resources :pets
  resources :users
  resources :store, only: [:index]

  root to:'static#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  post "/friendly_interactions/:id", to: "friendly_interactions#create", as: 'new_friendly_interaction'
  post '/owner_interactions/:id', to: 'owner_interactions#create'
  post '/store/:id', to: 'store#create'
end
