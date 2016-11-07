Rails.application.routes.draw do
  devise_for :users
  resources :groups
  resources :users
  resources :journals
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tracks do
  	resources :activities
  end
  
  root 'tracks#index'
end
