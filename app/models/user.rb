class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    create! do |user|
       user.provider = auth.provider
       user.uid = auth.uid
       user.name = auth.info.name
       user.oauth_token = auth.credentials.token
       user.oauth_expires_at = Time.now
       user.save!
    end
  end
end
