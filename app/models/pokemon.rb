class Pokemon < ApplicationRecord
  belongs_to :category
  has_many :order_items
  paginates_per 10
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :height, presence: true
  validates :weight, presence: true
  validates :candy, presence: true
  validates :category_id, presence: true, numericality: { only_integer: true }
end
