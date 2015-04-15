Rails.application.routes.draw do
  root "analytics#index"
  resources :analytics
end
