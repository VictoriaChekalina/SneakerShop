class Sneaker < ApplicationRecord
  belongs_to :brand
  mount_uploader :image, ImageUploader
  validates :brand_id, presence: true
end
