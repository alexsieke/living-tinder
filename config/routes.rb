LivingTinder::Application.routes.draw do
      
  resources :deal_tags, only: [:new, :create]

  resources :users, only: [:new, :create]

  resources :deals, only: [:index, :show]

  root "users#new"

  get 'home' => "pages#home"

  get 'signout' => 'users#destroy'
  get 'viewdeals' => 'pages#viewdeals'

  
end
