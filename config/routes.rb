Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'
  resources :posts do
    resources :comments
  end
  get "/users/:username", to: "users#show", as: :show_user

end