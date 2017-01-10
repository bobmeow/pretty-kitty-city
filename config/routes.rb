Rails.application.routes.draw do
  resources :friendships
  resources :pets
  resources :users
  get '/login', to: 'sessions#new'
  
end
