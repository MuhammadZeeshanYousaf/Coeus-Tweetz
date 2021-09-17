Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :posts do
    resources :comments
  end

  get "/users/:username", to: "users#show", as: :show_user
  get "posts/:username/tweets", to: "posts#my_posts", as: :my_posts

  resources :users do
    get "/follow", to: "users#follow", as: :follow
  end

end