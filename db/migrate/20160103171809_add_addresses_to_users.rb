class AddAddressesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :billing_id, :integer, index: true
    add_column :users, :shipping_id, :integer, index: true
    # add_foreign_key :users, :addresses, column: :shipping_id
    # add_foreign_key :users, :addresses, column: :billing_id
  end
end
