RatedateRuby::Application.routes.draw do


  root 'static_pages#index'
  resources :sessions, only: [:create, :destroy]

  
  match '/terms', to: 'static_pages#terms', via: 'get'
  match '/privacy', to: 'static_pages#privacy', via: 'get'
  match '/aboutus', to: 'static_pages#aboutus', via: 'get'


  match '/auth/:provider/callback', to: 'sessions#create', via: "get"
  match '/signin', to: 'sessions#new', via: 'post'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/auth/failure', to: 'sessions#failure', via: "get"
end
