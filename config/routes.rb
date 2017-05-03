Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :stats
  resources :matches
  resources :series
  resources :players
  resources :teams
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#check_user"
  get "login" => "home#login"
  get "dashboard" => "home#dashboard"
  get "points" => "home#points"
end
