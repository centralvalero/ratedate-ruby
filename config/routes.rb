RatedateRuby::Application.routes.draw do
  
  root 'static_pages#index'

  
  match '/terms', to: 'static_pages#terms', via: 'get'
  match '/privacy', to: 'static_pages#privacy', via: 'get'


  resources :users

end
