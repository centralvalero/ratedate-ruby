class Authentication < ActiveRecord::Base
  belongs_to :user
  PROVIDER = ["facebook"]
  validate :uid, :presence => true, :uniqueness => { :scope => :provider }
 
  attr_accessible :provider, :uid
end
