class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.decimal :price
      t.integer :quantity
      t.integer :order_id
      t.integer :pokemon_id

      t.timestamps
    end
  end
end
