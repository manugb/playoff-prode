Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  resources :stats
  resources :matches
  resources :series
  resources :players
  resources :teams
  resources :users
  resources :serie_stats
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#check_user"
  get "probando/home" => "home#home"
  get "login" => "home#login"
  get "dashboard" => "home#dashboard"
  get "points" => "home#points"
  get "semis" => "home#semis"
  get "finals" => "home#finals"
  get "/services/fix_serie_stats" => "home#fix_serie_stats_winner"
end
