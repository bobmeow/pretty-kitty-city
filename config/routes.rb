Rails.application.routes.draw do
  resources :friendships
  resources :pets
  resources :users
  root to:'static#index'
  get '/login', to: 'sessions#new'
end
