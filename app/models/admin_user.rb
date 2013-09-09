class AdminUser < ActiveRecord::Base
  attr_accessible :user_id, :status

  belongs_to :user
end
