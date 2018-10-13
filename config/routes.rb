Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:index, :show, :new, :create] do
    resources :messages, only: [:index, :create, :destroy]
    member do
      get :followings
      get :followers
      get :favorites
    end
  end
  
  resources :posts, only: [:show, :create, :destroy, :update, :edit] do
    resources :comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
