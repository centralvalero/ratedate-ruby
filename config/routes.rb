RatedateRuby::Application.routes.draw do


  root 'static_pages#index'
  	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  
  match '/terms', to: 'static_pages#terms', via: 'get'
  match '/privacy', to: 'static_pages#privacy', via: 'get'
  match '/aboutus', to: 'static_pages#aboutus', via: 'get'
end
