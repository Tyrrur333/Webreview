class Apppost < ApplicationRecord
  validates :app_name, presence: true, length: {maximum: 60}
  validates :category, presence: true, length: {maximum: 30}
  validates :url,presence: true, length: {maximum: 255},
            format: /\A#{URI::regexp(%w(http https))}\z/,
            uniqueness: { case_sensitive: false }
  validates :author, presence: true, length: {maximum: 60}
  validates :description, presence: true, length: {maximum:500}
end
