Rails.application.routes.draw do

  root to: 'sessions#new'
  
  get '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'users#create_google' 

   get '/rental_properties/:rental_property_id/repairs', to: 'repairs#index_property', as: 'property_repairs'

   get '/repairs/open_ticket_repairs', to: 'repairs#open_ticket_repairs', as: 'open_ticket_repairs'

   get 'users/:user_id/rental_properties/available_properties', to: 'rental_properties#available_properties', as: 'available_properties'

  resources :sessions, only: [:new, :create]

  resources :users do 
    resources :rental_properties 
    resources :tenants
    resources :repairs
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

  
 

  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
