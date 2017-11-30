Rails.application.routes.draw do

  root 'products#index'

  devise_for :users
  resources :address_types
  resources :products

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
