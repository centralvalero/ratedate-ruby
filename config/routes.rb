RatedateRuby::Application.routes.draw do


  	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
devise_scope :user do
  get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
end

  root 'static_pages#index'

  
  match '/terms', to: 'static_pages#terms', via: 'get'
  match '/privacy', to: 'static_pages#privacy', via: 'get'
  match '/aboutus', to: 'static_pages#aboutus', via: 'get'
end
