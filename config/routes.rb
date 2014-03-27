LivingTinder::Application.routes.draw do
      
  resources :deal_tags, only: [:new, :create]

  resources :tags, except: [:new, :update, :edit, :show]

  resources :users, only: [:new, :create]

  resources :deals, only: [:index, :show]

  resources :tinders, only: [:new, :create]

  root "users#new"

  
end
