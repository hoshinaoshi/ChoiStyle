class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :stylist
  belongs_to :cut_model

  scope :of_user, lambda{|user|
    where(user_id: user.id).active
  }
  scope :active, lambda{
    where(deleted: false)
  }
  scope :newest, lambda{
    order("created_at DESC")
  }

end
