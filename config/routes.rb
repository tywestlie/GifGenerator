Rails.application.routes.draw do
  root to: 'home#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  resources :users, shallow: true do
    resources :favorites
  end

  namespace :admin do
    resources :gifs
    resources :categories
  end

  resources :categories, only: [:index, :show]
  resources :gifs, only: [:index, :show]
end
