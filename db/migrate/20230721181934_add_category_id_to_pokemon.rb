class AddCategoryIdToPokemon < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :category_id, :integer
    add_reference :pokemons, :categories, null: false, foreign_key: true
  end
end
