class Product < ApplicationRecord
  belongs_to :store
  belongs_to :user

  mount_uploader :image, ImageUploader
end
