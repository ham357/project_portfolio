class Item < ApplicationRecord
  validates :contents, length: { maximum: 1000 }
  validates :contents, presence: true

  mount_uploader :image, ImageUploader
end
