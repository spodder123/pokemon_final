class Order < ApplicationRecord
  has_many :order_items
  validates :province, presence: true
  validates :PST, :GST, :HST, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :status, presence: true, inclusion: { in: %w[pending paid shipped] }
  validates :total, numericality: { greater_than_or_equal_to: 0 }
end
