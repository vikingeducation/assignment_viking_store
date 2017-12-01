Rails.application.routes.draw do

  root 'products#index'

  devise_for :users
  resources :users, only: [:index, :show]
  resources :addresses, only: [:new, :edit]
  resources :address_types
  resources :products
  resources :orders, only: [:show]
  get '/checkout', to: 'checkout#create', as: 'create_checkout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
