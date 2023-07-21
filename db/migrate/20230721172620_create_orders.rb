class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :province
      t.decimal :PST
      t.decimal :GST
      t.decimal :HST
      t.string :status
      t.decimal :total
      t.integer :user_id

      t.timestamps
    end
  end
end
