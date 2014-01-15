RatedateRuby::Application.routes.draw do
  

  root 'static_pages#index'

  
  match '/terms', to: 'static_pages#terms', via: 'get'
  match '/privacy', to: 'static_pages#privacy', via: 'get'


  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  #user signup, login, and logout
  get "signup" => "users#new", :as => "signup"
  get "signin" => "sessions#new", :as => "signin"
  delete "signout" => "sessions#destroy", :as => "signout"

end
