class Apppost < ApplicationRecord
  attr_accessor :apppost
  validates :app_name, presence: true, length: {maximum: 60}
  validates :category, presence: true, length: {maximum: 30}
  validates :url,presence: true, length: {maximum: 255},
            format: /\A#{URI::regexp(%w(http https))}\z/,
            uniqueness: { case_sensitive: false }, allow_nil: true
  validates :author, presence: true, length: {maximum: 60}
  validates :description, presence: true, length: {maximum:500}
  mount_uploader :app_image, ImageUploader
end
