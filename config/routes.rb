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

  post "follow", to: 'follows#follow', as: :follow
  delete "unfollow", to: 'follows#unfollow', as: :unfollow
  delete "cancel_request", to: 'follows#cancel_request', as: :cancel_request
    
  post 'accept_follow', to: 'follows#accept_follow', as: :accept_follow
  delete 'decline_follow', to: 'follows#decline_follow', as: :decline_follow
    
    
  post "toggle_like", to: "likes#toggle_like", as: :toggle_like
  
  put "/animal/:id/add_animal", to: 'animals#add_animal', as: :add_animal
    
  put "/animal/:id/add_animal_venue", to: 'animals#add_animal_venue', as: :add_animal_venue
  
end
