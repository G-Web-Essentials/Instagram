Rails.application.routes.draw do
  resources :animals
  devise_for :users
  resources :users, only: [:show]
  devise_for :venues
  resources :venues, only: [:show]
  resources :posts do
      resources :comments
  end
  resources :comments

  
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  
  post "toggle_like", to: "likes#toggle_like", as: :toggle_like
  
end
