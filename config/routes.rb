Rails.application.routes.draw do
  root :to => 'posts#index'

  resources :posts do
    resources :tags
  end

end
