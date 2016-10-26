class User < ActiveRecord::Base
  has_secure_password

  has_many :logs
  has_many :factors

  validates_uniqueness_of :username, allow_blank: false
  validates_presence_of :password, on: :create 
  validates_presence_of :password_confirmation, on: :create 
  validates_confirmation_of :password, message: "does not match"
end
