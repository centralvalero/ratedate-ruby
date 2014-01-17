RatedateRuby::Application.routes.draw do
  

  get "sessions/create"
  get "sessions/destroy"
  root 'static_pages#index'

  
  match '/terms', to: 'static_pages#terms', via: 'get'
  match '/privacy', to: 'static_pages#privacy', via: 'get'
  match '/aboutus', to: 'static_pages#aboutus', via: 'get'


	
  get '/auth/:provider/callback'  => 'sessions#create'
  post '/signin'                  => 'sessions#new',        :as => :signin
  delete '/signout'               => 'sessions#destroy',    :as => :signout
  get '/auth/failure'             => 'sessions#failure'
end
