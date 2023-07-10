Rails.application.routes.draw do
  resources :matches
  resources :teams
  resources :locations
  resources :sports
  resources :players
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
