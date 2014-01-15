OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '333505546788462', 'e2124f1b88ccb4e4274544bd3130f9df', :scope => 'email,user_photos', :display => 'popup'
end