  Rails.application.routes.draw do
  #   devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)
    get 'profiles/show'
    # get 'pages/home'
    # root to: 'pages#home'
    devise_for :users 
    devise_scope :user do  
      get '/users/sign_out' => 'devise/sessions#destroy'     
  end

    resources :posts do
      resources :comments, only: [:create, :destroy, :new, :index]
      member do
        post 'share' 
        post 'create_likes', to: 'likes#create_likes', as: 'create_likes'
        delete 'like/:id', to: 'likes#destroy', as: 'destroy_like'
        # get 'comments/new', to: 'comments#new', as: 'new_comment'
      end
    end   
    # resources :comments, only: [:create, :destroy]
    root to: 'posts#index'
    resources :follows, only: [:create, :destroy]
    
    resources :relationships, only: [:create, :destroy]
    get '/profiles/:username', to: 'profiles#show', as: 'profile' 

    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    
    # Defines the root path route ("/")
    # root "articles#index"
  end