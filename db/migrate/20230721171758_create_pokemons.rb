class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.decimal :price
      t.string :height
      t.string :weight
      t.string :candy

      t.timestamps
    end
  end
end
