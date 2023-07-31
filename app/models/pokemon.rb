# class Pokemon < ApplicationRecord
#   belongs_to :category
#   has_many :order_items
#   paginates_per 10
#   validates :name, presence: true
#   validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
#   validates :height, presence: true
#   validates :weight, presence: true
#   validates :candy, presence: true
#   validates :category_id, presence: true, numericality: { only_integer: true }
# end
class Pokemon < ApplicationRecord

  belongs_to :category
  has_many :order_items
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :height, presence: true
  validates :weight, presence: true
  validates :candy, presence: true
  validates :category_id, presence: true, numericality: { only_integer: true }

  def self.ransackable_attributes(auth_object = nil)
    ["candy", "categories_id", "category_id", "created_at", "height", "id", "name", "price", "updated_at", "weight"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["category", "order_items"]
  end

end
