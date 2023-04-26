Rails.application.routes.draw do
  resources :tags
  root to: "posts#index"
  
  resources :posts do
    get 'page/:page', action: :index, on: :collection
    resources :comments
  end

  get "password_reset", to: "password_resets#new", as: :edit_password
  post "password_reset", to: "password_resets#create"
  get "password_reset/edit", to: "password_resets#edit"
  patch "password_reset/edit", to: "password_resets#update"

  get "profile", to: "profile#edit", as: :edit_profile
  patch "profile", to: "profile#update"

  get "sign_in", to: "registrations#new"
  post "sign_in", to: "registrations#create"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
