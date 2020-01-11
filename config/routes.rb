Rails.application.routes.draw do
    root to: "toppages#index"
    
    get "signup", to: "users#new"
    resources :users, only: [:show, :new, :create]
    
    get "login", to: "sessions#new"
    post "login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"
    
    get "housework_list", to: "houseworks#index"
    resources :houseworks, only: [:new, :create, :destroy]
    
    resources :housework_schedules, only: [:new, :create, :destroy]
    
    resources :relationships, only: [:create, :update, :destroy]
    
    resources :contacts, only: [:new, :create]
end