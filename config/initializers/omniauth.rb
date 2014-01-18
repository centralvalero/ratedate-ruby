OmniAuth.config.logger = Rails.logger
 
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook, '333505546788462', 'e2124f1b88ccb4e4274544bd3130f9df'
  provider :twitter, '9uwdxjJD2lR5lqZWJspSWw', 'N7WC66nwOJTi6mQylAp2AOYOFNPzmPgDUbeh0NET6m4'
end
