class CutModel < ActiveRecord::Base
  belongs_to :user
  has_one :cut_model_image
  accepts_nested_attributes_for :cut_model_image, :allow_destroy => true

  scope :active, lambda{ where(deleted: false) }
  scope :order_sign_in, lambda{ order("users.last_sign_in_at DESC") }
  scope :of_cut_model, lambda{|id| where(id: id) }
  scope :of_prefecture, lambda{|prefecture| where(prefecture: prefecture) }
  scope :of_area, lambda{|area| where(area: area) }

  scope :search_want_long, lambda{|param|
    where("want_long >= #{param}")
  }
  scope :search_want_style, lambda{|param|
    where(want_style: param)
  }
  scope :search_can_style, lambda{|param|
    where(can_style: param)
  }

  def new_empty_image
    self.build_cut_model_image
  end
end
