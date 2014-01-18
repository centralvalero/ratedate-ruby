OmniAuth.config.logger = Rails.logger
 
Rails.application.config.middleware.use OmniAuth::Builder do
<<<<<<< HEAD
  provider :facebook, '333505546788462', 'e2124f1b88ccb4e4274544bd3130f9df'
end
=======
  provider :facebook, ENV['333505546788462'], ENV['e2124f1b88ccb4e4274544bd3130f9df']
  #provider :twitter, ENV['SOME-INFO-HERE'], ENV['SOME-INFO-HERE']
end
>>>>>>> 2d3300c8c0c2cd756f25428c40a0a8e1f8ab39e3
