class Comment < ApplicationRecord
  validates :comment, {presence: true}
  validates :user_id, {presence:true}
  validates :article_id, {presence:true}
end
