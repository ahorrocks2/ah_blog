Rails.application.routes.draw do
  root :to => 'home#index'

  resources :posts do
    resources :tags
    resources :comments, :except => [:index, :show]
  end

  resources :tags do
    resources :posts
  end

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out
end
