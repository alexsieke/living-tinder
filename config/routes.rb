LivingTinder::Application.routes.draw do
      
  resources :tinders, only: [:new, :create]

  root "tinders#new"
  
end
