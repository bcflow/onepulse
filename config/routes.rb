Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :sentences do
    resources :blips, only: [:create, :destroy]
  end

  

  root to: "sentences#index"

  # USER AUTH ROUTES

  resources :users

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  get "/history" => "users#history"



end
