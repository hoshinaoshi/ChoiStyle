class Salon < ActiveRecord::Base
  belongs_to :user
  has_many :stylists
  has_many :salon_images
  accepts_nested_attributes_for :salon_images, :allow_destroy => true
  
  def new_empty_images number_of_images
    (1..(number_of_images - self.salon_images.size)).each do
      salon_images << SalonImage.new
    end
  end
end
