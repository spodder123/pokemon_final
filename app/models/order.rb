class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  validates :province, presence: true
  validates :PST, :GST, :HST, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :status, presence: true, inclusion: { in: %w[pending processing completed cancelled] }
  validates :total, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, presence: true, numericality: { only_integer: true }
end
