Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :posts do
    resources :comments
  end

  get "/users/:username", to: "users#show", as: :show_user
  get "/users/:username/followings", to: "users#followings", as: :followings
  get "/users/:username/followers", to: "users#followers", as: :followers
  get "posts/:username/tweets", to: "posts#my_posts", as: :my_posts

  resources :users do
    get "/follow", to: "users#follow", as: :follow
  end

end