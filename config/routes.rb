Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'
  resources :posts
  get "/users/:username", to: "users#show", as: :show_user

end