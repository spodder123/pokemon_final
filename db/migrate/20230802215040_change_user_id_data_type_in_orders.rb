class ChangeUserIdDataTypeInOrders < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :user_id, :string
  end
end
