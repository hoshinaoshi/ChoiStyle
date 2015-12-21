class Offer < ActiveRecord::Base
  belongs_to :cut_model
  belongs_to :salon
  belongs_to :stylist
  
  scope :of_user, lambda{|current_user|
    if current_user.cut_model?
      where(cut_model_id: current_user.cut_model.id)
    elsif current_user.salon?
      where(salon_id: current_user.salon.id)
    elsif current_user.stylist?
      where(stylist_id: current_user.stylist.id)
    end
  }

  scope :of_user_type, lambda{|user_type|
    where(offer_type: user_type)
  }

  scope :newest, lambda{
    order("created_at DESC")
  }
  
  scope :sender, lambda{|offer_type|
    where(offer_type: offer_type)
  }

  scope :receive, lambda{|offer_type|
    where.not(offer_type: offer_type)
  }

  def cut_model?
    return self.offer_type.to_i == USER_TYPE_MODEL
  end

  def stylist?
    return self.offer_type.to_i == USER_TYPE_STYLIST
  end

  def cut_salon?
    return self.offer_type.to_i == USER_TYPE_SALON
  end

  def stylist_or_salon?
    return [USER_TYPE_STYLIST,USER_TYPE_SALON].include?(self.offer_type.to_i)
  end
  
  def in_progress?
    return self.status == OFFER_STATUS_IN_PROGRESS
  end
  
  def ok?
    return self.status == OFFER_STATUS_OK
  end

  def ng?
    return self.status == OFFER_STATUS_NG
  end
  
  def receive_user
    if self.cut_model?
      return self.stylist.user.blank? ? self.stylist.salon.user : self.stylist.user
    else
      return self.cut_model.user
    end
  end

  def sender_user
    if self.cut_model?
      return self.cut_model.user
    else
      return self.stylist.user.blank? ? self.stylist.salon.user : self.stylist.user
    end
  end
end
