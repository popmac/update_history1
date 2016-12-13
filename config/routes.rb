Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :homes, only: [:index]
  resources :reviews
  root 'homes#index'
end
