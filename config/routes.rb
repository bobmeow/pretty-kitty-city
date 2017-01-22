Rails.application.routes.draw do

  resources :friendships
  resources :pets
  resources :users
  resources :store, only: [:index, :new, :create, :show]

  root to:'static#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  post "/friendly_interactions/:id", to: "friendship_interactions#create", as: 'new_friendship_interaction'
  post '/owner_interactions/:id', to: 'owner_interactions#create'
  post '/store/:id', to: 'store#create'

  get '/admin', to: 'admins#new'
  post '/admins', to: 'admins#create'
  get '/admins', to: 'admins#index', as: 'admins_homepage'
  get '/analytics', to: 'analytics#index'
  resources :items
end
