class SalonImage < ActiveRecord::Base
  belongs_to :salon
  mount_uploader :image , SalonImageUploader
  validates :image, presence: true
end
