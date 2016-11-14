Rails.application.routes.draw do
  devise_for :users
  resources :groups do |t|
    member do
      post :create_role
    end
  end
  resources :users, only: [:index, :show]
  resources :posts do
    collection do
      get '/user_posts', to: 'posts#user_posts', as: :user
    end
    collection do
      get '/group_posts', to: 'posts#group_posts', as: :group
    end
  end
  resources :journals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tracks do
  	resources :activities do
      member do
        get :receive
      end
      member do
        get :reflect
      end
      member do
        get :respond
      end
    end
  end
  
  root 'posts#index'
end
