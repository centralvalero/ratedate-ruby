OmniAuth.config.logger = Rails.logger
 
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['333505546788462'], ENV['e2124f1b88ccb4e4274544bd3130f9df']
end
