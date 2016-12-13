Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :homes
  root 'homes#index'
end
