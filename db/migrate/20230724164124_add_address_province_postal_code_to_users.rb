class AddAddressProvincePostalCodeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address, :string
    add_reference :users, :province, foreign_key: true, index: true, null: true
    add_column :users, :postal_code, :string
  end
end
