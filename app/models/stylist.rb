class Stylist < ActiveRecord::Base
  belongs_to :user
  belongs_to :salon
  has_one :stylist_image
  accepts_nested_attributes_for :stylist_image, :allow_destroy => true
  
  scope :active, lambda{ where(deleted: false) }
  scope :newest, lambda{ order("created_at DESC") }
  scope :order_amout, lambda{ order("order_amount Desc") }
  scope :exists_order_amout, lambda{ order("order_amount <> 0") }
  scope :of_stylist, lambda{|id| where(id: id) }
  scope :of_salon, lambda{|salon_id| where(salon_id: salon_id) }
  scope :of_prefecture, lambda{|prefecture| where(salon_prefecture: prefecture) }
  scope :of_area, lambda{|area| where(salon_area: area) }
  
  scope :search_want_long, lambda{|param|
    where("want_long <= #{param}")
  }
  scope :search_want_style, lambda{|param|
    where(want_style: param)
  }
  scope :search_can_style, lambda{|param|
    where(can_style: param)
  }
  
  def new_empty_image
    self.build_stylist_image
  end
  
  def logical_destory
    self.update_attributes!(deleted: true)
  end

  def belongs_to_salon?
    self.salon_id.present?
  end

  def woman?
    return self.gender == GENDER_WOMAN
  end
end
