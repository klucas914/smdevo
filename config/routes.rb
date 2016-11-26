Rails.application.routes.draw do
  devise_for :users
  resources :journals do
    collection do
      get '/user_journals', to: 'journals#user_journals', as: :user
    end
  end
  resources :users
  resources :groups do |t|
    member do
      post :create_role
    end
    member do
      post :add_track, path: '/add_track'
    end
    resources :posts do
      collection do
        get '/user_posts', to: 'posts#user_posts', as: :user
      end
    end
  end
  
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
  resources :scriptures
  root 'posts#user_posts'
end
