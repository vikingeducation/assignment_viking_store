class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id, :null => false # user_id
      t.integer :shipping_address, :null => false # address_id
      t.integer :billing_address, :null => false # address_id

      t.timestamps
    end
  end
end
