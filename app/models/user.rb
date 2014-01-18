class User < ActiveRecord::Base

<<<<<<< HEAD
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
=======
   def self.from_omniauth(auth)
     where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
       user.provider = auth.provider
       user.uid = auth.uid
       user.name = auth.info.name
       user.oauth_token = auth.credentials.token
       user.oauth_expires_at = Time.at(auth.credentials.expires_at)
       user.save!
     end
   end
>>>>>>> 2d3300c8c0c2cd756f25428c40a0a8e1f8ab39e3
end
