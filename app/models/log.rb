class Log < ActiveRecord::Base
  belongs_to :user
  has_many :factor_logs

  accepts_nested_attributes_for :factor_logs
end
