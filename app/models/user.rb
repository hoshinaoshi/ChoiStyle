class User < ActiveRecord::Base
  has_many :favorites
  has_one :admin_user
  has_one :salon
  has_one :cut_model
  has_one :stylist
  accepts_nested_attributes_for :salon, :allow_destroy => true
  accepts_nested_attributes_for :cut_model, :allow_destroy => true
  accepts_nested_attributes_for :stylist, :allow_destroy => true

  scope :newest, lambda{
    order("created_at DESC")
  }

  def not_register?
    return self.user_type.blank?
  end

  def cut_model?
    return self.user_type == USER_TYPE_MODEL
  end

  def stylist?
    return self.user_type == USER_TYPE_STYLIST
  end

  def salon?
    return self.user_type == USER_TYPE_SALON
  end

  def man?
    return self.gender == GENDER_MAN
  end

  def woman?
    return self.gender == GENDER_WOMAN
  end

  def admin_user?
    self.admin_user.present?
  end
  
  def billing_location_register?
    if self.salon?
      return self.salon.billing_location.present? && self.salon.billing_zip.present?
    else
      return self.stylist.billing_location.present? && self.stylist.billing_zip.present?
    end
  end

  def prefecture
    if self.cut_model?
      self.cut_model.prefecture
    elsif self.stylist?
      self.stylist.salon_prefecture
    else
      self.salon.salon_prefecture
    end
  end

  def area
    if self.cut_model?
      self.cut_model.area
    elsif self.stylist?
      self.stylist.salon_area
    else
      self.salon.salon_area
    end
  end

  def provider_twitter?
    self.provider == "twitter"
  end
  
  def provider_facebook?
    self.provider == "facebook"
  end

  def send_twitter(message)
    return unless ENV['RAILS_ENV'] == "production"
    if self.provider_twitter?
      client = Twitter::Client.new(
        consumer_key: "T6vKbPCr3BkJnGWarNuEWg",
        consumer_secret: "HY5lk52DM3aPoc5NgsN04zWVKA1jBVCPAwPkpcCU",
        oauth_token: self.token,
        oauth_token_secret: self.secret_token
      )
      client.update(message)
    end
  rescue => e
  end
end
