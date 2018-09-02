class Review < ApplicationRecord
  belongs_to :user
  belongs_to :apppost
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :review_title, presence: true, length: {maximum: 60}
  validates :review_content, presence: true,length: {maximum: 500}
end
