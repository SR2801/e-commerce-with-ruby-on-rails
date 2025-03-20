class Item < ApplicationRecord
  include Notifications

  has_rich_text :description
  has_one_attached :featured_image
  has_many :subscribers, dependent: :destroy


  validates :name, presence: true
  validates :inventory_count, numericality: { greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than: 0 }
end
