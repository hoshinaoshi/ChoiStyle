class StylistImage < ActiveRecord::Base
  belongs_to :stylist
  mount_uploader :image , StylistImageUploader
  validates :image, presence: true
end
