Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :blogs
  resources :tags
  resources :posts

  root "sessions#new"

  get "/signup", to: "users#new"
  get "/signin", to: "sessions#new"
  delete "/signout", to: "sessions#destroy"

  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
end
