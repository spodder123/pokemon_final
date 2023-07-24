class Category < ApplicationRecord
  has_many :pokemons
  paginates_per 10
end
