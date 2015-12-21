class Chat < ActiveRecord::Base
  belongs_to :offer
  belongs_to :salon
  belongs_to :stylist
  belongs_to :cut_model
  has_many :chat_messages
  accepts_nested_attributes_for :chat_messages, :allow_destroy => true

  scope :of_user, lambda{|current_user|
    if current_user.cut_model?
      where(cut_model_id: current_user.cut_model.id)
    elsif current_user.salon?
      where(salon_id: current_user.salon.id)
    elsif current_user.stylist?
      where(stylist_id: current_user.stylist.id)
    end
  }

  scope :newest, lambda{
    order("created_at DESC")
  }
end
