Rails.application.routes.draw do
  devise_for :users
  resources :groups do |t|
    member do
      post :create_role
    end
    resources :posts do
      collection do
        get '/user_posts', to: 'posts#user_posts', as: :user
      end
    end
    member do
      get :group_wall
    end
  end
  resources :users, only: [:index, :show] do
    resources :journals, shallow: true
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tracks do |t|
  	member do
      post :create_selection
    end
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
  
  root 'posts#user_posts'
end
