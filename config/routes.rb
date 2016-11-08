Rails.application.routes.draw do
  devise_for :users
  resources :groups
  resources :posts do
    collection do
      get '/user_posts', to: 'posts#user_posts', as: :user
    end
  end
  resources :journals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tracks do
  	resources :activities
  end
  
  root 'posts#index'
end
