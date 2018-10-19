Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:index, :show, :new, :destroy, :create] do
    resources :messages, only: [:index, :create, :destroy]
    collection do
      get :subject_select
    end
    member do
      get :followings
      get :followers
      get :favorites
    end
  end
  
  # get 'users/subject_select', as: 'subject_select'
  
  resources :posts, only: [:index, :show, :create, :destroy, :update, :edit] do
    resources :comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
