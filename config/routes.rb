RatedateRuby::Application.routes.draw do


  root 'static_pages#index'
  resources :sessions, only: [:create, :destroy]

  
  match '/terms', to: 'static_pages#terms', via: 'get'
  match '/privacy', to: 'static_pages#privacy', via: 'get'
  match '/aboutus', to: 'static_pages#aboutus', via: 'get'


  get '/auth/:provider/callback'  => 'sessions#create'
  post '/signin'                  => 'sessions#new',        :as => :signin
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  get '/auth/failure'             => 'sessions#failure'
end
