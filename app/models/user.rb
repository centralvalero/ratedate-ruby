class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  
  #name
  validates :fname, presence: true, length: { maximum: 25 }
  validates :lname, presence: true, length: { maximum: 50 }
  
  #email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  
  #password
  has_secure_password
  validates :password, length: { minimum: 8 }
end
