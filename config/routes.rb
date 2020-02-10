Rails.application.routes.draw do

  root to: 'sessions#new'
  
  get '/logout', to: 'sessions#destroy'

  get '/auth/google_oauth2/callback', to: 'sessions#create' 

  resources :sessions, only: [:new, :create]

  resources :users do 
    resources :rental_properties 
  end 

  resources :users, only: [:new, :create, :show]

  resources :tenants
  resources :repairs
  resources :rental_properties do 
    resources :tenants 
  end

  resources :rental_properties do 
    resources :repairs
  end

  resources :rental_properties do 
    resources :payments
  end

  resources :payments
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
