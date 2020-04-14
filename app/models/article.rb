class Article < ApplicationRecord
  validates :content, {presence:true}
  mount_uploader :image_name, ImageUploader
end
