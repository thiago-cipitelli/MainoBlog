Rails.application.routes.draw do
  root to: "post#index"
  
  get "post", to: "post#index"

  get "sign_in", to: "registrations#new"
  post "sign_in", to: "registrations#create"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
