Rails.application.routes.draw do

root 'address_types#index'
resources :address_types

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
