LivingTinder::Application.routes.draw do
      
  resources :users, only: [:new, :create]

  resources :tinders, only: [:new, :create]

  root "users#new"

  
end
