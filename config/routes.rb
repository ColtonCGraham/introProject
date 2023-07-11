Rails.application.routes.draw do
  resources :locations
  resources :matches
  resources :teams
  resources :sports
  resources :players
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
