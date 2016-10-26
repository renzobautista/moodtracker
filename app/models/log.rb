class Log < ActiveRecord::Base
  belongs_to :user
  has_many :category_logs
end
