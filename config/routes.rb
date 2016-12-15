Rails.application.routes.draw do
  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :homes, only: [:index]
  resources :reviews do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  resources :user_relationships, only: [:create, :destroy]
  root 'homes#index'
end
