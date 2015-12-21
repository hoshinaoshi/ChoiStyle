class CutModelImage < ActiveRecord::Base
  belongs_to :cut_model
  mount_uploader :image , CutModelImageUploader
  validates :image, presence: true
end
