class User < ActiveRecord::Base
  has_many :logs
  has_many :categories
end
