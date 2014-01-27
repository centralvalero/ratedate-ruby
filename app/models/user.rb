class User < ActiveRecord::Base

	#attr_accessible :email, :password, :password_confirmation, :name 
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :twitter]

 	def self.find_for_facebook_oauth(auth)
	  	user = User.where(:provider => auth.provider, :uid => auth.uid).first
    	unless user
      	user = User.create(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           image:auth.info.image,
                           gender:auth.info.gender,
                           relationship_status:auth.info.relationship_status,
                           password:Devise.friendly_token[0,20])
    	end
    	user
	end

	def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
		user = User.where(:provider => auth.provider, :uid => auth.uid).first
		if user
		  return user
		else
		  registered_user = User.where(:email => auth.uid + "@twitter.com").first
		  if registered_user
		    return registered_user
		  else
		    user = User.create(name:auth.extra.raw_info.name,
		                        provider:auth.provider,
		                        uid:auth.uid,
		                        email:auth.uid+"@twitter.com",
		                        password:Devise.friendly_token[0,20]
		                      )
		  end
		end
	end

	def self.new_with_session(params, session)
		super.tap do |user|
		  if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
		    user.email = data["email"] if user.email.blank?
		  end
		end
	end

	def email_required?
	  provider.blank?
	end
end
