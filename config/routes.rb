Rails.application.routes.draw do

  root to: 'sessions#new'

  resources :sessions, only: [:new, :create]
  resources :users, only: [:new, :create, :show]

  resources :tenants
  resources :repairs
  resources :rental_properties
  resources :payments
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
