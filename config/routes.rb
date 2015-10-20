Rails.application.routes.draw do
  root :to => 'home#index'

  resources :posts do
    resources :tags
  end

  resources :tags do
    resources :posts
  end

end
