class OrderHistory < ActiveRecord::Base
  belongs_to :salon
  belongs_to :stylist
  scope :of_salon, lambda{|salon_id| where(salon_id: salon_id) }
  scope :of_stylist, lambda{|id| where(id: id) }
end
