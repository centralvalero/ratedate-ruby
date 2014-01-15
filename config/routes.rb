RatedateRuby::Application.routes.draw do
  
  root 'static_pages#index'
  get 'static_pages/terms'
  get 'static_pages/privacy'

end
