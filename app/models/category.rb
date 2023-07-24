class Category < ApplicationRecord
  has_many :pokemons
  paginates_per 10
  validates :name, presence: true, uniqueness: true
end
