class User < ActiveRecord::Base
<<<<<<< HEAD
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :authorizations, :dependent => :destroy
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
=======

  def self.from_omniauth(auth)
    create! do |user|
       user.provider = auth['provider']
       user.uid = auth['uid']
       user.name = auth['info']['name']
       user.oauth_token = auth.credentials.token
       user.oauth_expires_at = Time.now
       user.save!
    end
  end
>>>>>>> parent of 13ef3a5... removed sessions and user, now installing devise
end
