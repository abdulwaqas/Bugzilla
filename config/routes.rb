Rails.application.routes.draw do
  get 'users/index'
  match '/users',   to: 'users#index',   via: 'get'
  devise_for :users
  resources :users
  
  resources :bugs
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
