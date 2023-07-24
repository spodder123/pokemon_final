class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :pokemon
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :order_id, presence: true, numericality: { only_integer: true }
  validates :pokemon_id, presence: true, numericality: { only_integer: true }
end
