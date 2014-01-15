class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  
  #name
  validates :fname, presence: true, length: { maximum: 25 }
  validates :lname, presence: true, length: { maximum: 50 }
  
  #email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  
  #password
  has_secure_password
  validates :password, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  after_validation { self.errors.messages.delete(:password_digest) }

  #token for sessions
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  #search
    def self.search(query)
        where("fname like ?", "%#{query}%")
    end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
