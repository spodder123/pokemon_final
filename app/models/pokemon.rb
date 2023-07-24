class Pokemon < ApplicationRecord
  belongs_to :category
  has_many :order_items
  paginates_per 10
end
