Rails.application.routes.draw do
  resources :products
  resources :categories
  resources :sellers
  resources :clients
  resources :orders
  resources :lists
end
