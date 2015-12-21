class ChatMessage < ActiveRecord::Base
  belongs_to :chat
  mount_uploader :image , ChatMessageImageUploader
  
  def cut_model?
    return self.user_type == USER_TYPE_MODEL
  end

  def stylist?
    return self.user_type == USER_TYPE_STYLIST
  end

  def salon?
    return self.user_type == USER_TYPE_SALON
  end
end
