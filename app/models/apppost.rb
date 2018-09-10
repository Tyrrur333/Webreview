class Apppost < ApplicationRecord
  has_many :reviews
  belongs_to :category
  attr_accessor :apppost
  validates :app_name, presence: true, length: {maximum: 60}
  validates :category_id, presence: true
  validates :url,presence: true, length: {maximum: 255},
            format: /\A#{URI::regexp(%w(http https))}\z/,
            uniqueness: { case_sensitive: false }, allow_nil: true
  validates :app_image, presence: true
  validates :author, presence: true, length: {maximum: 60}
  validates :description, presence: true, length: {maximum:500}
  mount_uploader :app_image, ImageUploader
  default_scope -> { order(created_at: :desc) }

  def average_rate
    average = self.users.pluck(:stars).sum / self.users.count
  end
end
