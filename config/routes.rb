Rails.application.routes.draw do
  
  resources :friendships
  resources :pets
  resources :users

  root to:'static#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  post "/interactions/:id", to: "interactions#create"
  #patch '/pets/:id', to: 'pets#pet_me', as: 'pet_me'
end
