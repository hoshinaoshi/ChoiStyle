module ApplicationHelper
  def user_image(user, size = :thumb)
    url = "icons/user_male.png"
    if user.user.blank?
      if user.stylist_image.blank?
        url = "icons/user_female.png" if user.salon.user.woman?
      else
        url = user.stylist_image.image_url(size)
      end
    elsif user.user.cut_model?
      if user.cut_model_image.blank?
        url = "icons/user_female.png" if user.user.woman?
      else
        url = user.cut_model_image.image_url(size)
      end
    elsif user.user.stylist?
      if user.stylist_image.blank?
        if user.belongs_to_salon?
          url = "icons/user_female.png" if user.woman?
        else
          url = "icons/user_female.png" if user.user.woman?
        end
      else
        url = user.stylist_image.image_url(size)
      end
    else
      url = "icons/user_female.png" if user.user.woman?
    end
    return url
  end
  
  def salon_area stylist
    if stylist.belongs_to_salon?
      stylist.salon.salon_area
    else
      stylist.salon_area
    end
  end

  def salon_name stylist
    if stylist.belongs_to_salon?
      stylist.salon.salon_name
    else
      stylist.salon_name
    end
  end

  def salon_url stylist
    if stylist.belongs_to_salon?
      stylist.salon.salon_url
    else
      stylist.salon_url
    end
  end

  def salon_tel stylist
    if stylist.belongs_to_salon?
      stylist.salon.salon_tel
    else
      stylist.salon_tel
    end
  end

  def salon_location stylist
    if stylist.belongs_to_salon?
      stylist.salon.salon_location
    else
      stylist.salon_location
    end
  end

  def salon_station stylist
    if stylist.belongs_to_salon?
      stylist.salon.salon_station
    else
      stylist.salon_station
    end
  end

  def salon_prefecture stylist
    if stylist.belongs_to_salon?
      stylist.salon.salon_prefecture
    else
      stylist.salon_prefecture
    end
  end

  def stylist_gender stylist
    if stylist.belongs_to_salon?
      stylist.gender
    else
      stylist.user.gender
    end
  end

  def get_last_sign_in_at user
    if user.user.blank?
      user.salon.user.last_sign_in_at.strftime("%Y/%m/%d")
    else
      user.user.last_sign_in_at.strftime("%Y/%m/%d")
    end
  end
end
