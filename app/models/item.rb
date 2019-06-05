class Item < ApplicationRecord
  validates :contents, length: { maximum: 1000 }

  mount_uploader :image, ImageUploader
end
