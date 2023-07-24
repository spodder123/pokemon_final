class MakeProvinceIdNullableInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :province_id, :integer, null: true
  end
end
