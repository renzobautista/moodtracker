class CategoryLog < ActiveRecord::Base
  belongs_to :category
  belongs_to :log
end
