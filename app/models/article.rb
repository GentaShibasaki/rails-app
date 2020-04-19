class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :user_id, {presence: true}
  validates :content, {presence:true, length: {maximum: 140}}
  validates :title, {presence:true}
  mount_uploader :image, ImageUploader
end
