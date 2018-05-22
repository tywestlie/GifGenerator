Rails.application.routes.draw do
  root to: 'home#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users

  namespace :admin do
    resources :gifs
  end

  resources :gif, only: [:index]
end
