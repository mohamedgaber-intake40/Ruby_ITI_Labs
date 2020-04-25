Rails.application.routes.draw do
  
  # get 'sessions/login'
  # get 'sessions/home'
  # get 'sessions/profile'
  # get 'sessions/setting'
  # get 'users/new'
  get 'welcome/index'
  resources :articles do
    resources :comments
  end


  root :to => "sessions#login"
  get "signup", :to => "users#new"
  post "signup", :to => "users#create"
  get "login", :to => "sessions#login"
  post "login", :to => "sessions#login_attempt"
  # get 'attemp',:to => "sessions#login_attempt"
  get "logout", :to => "sessions#logout"
  get "home", :to => "sessions#home"
  get "profile", :to => "sessions#profile"
  get "setting", :to => "sessions#setting"


end
