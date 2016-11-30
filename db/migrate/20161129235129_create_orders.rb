class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer     :user_id
      t.integer     :shipping_addr_id
      t.integer     :billing_addr_id

      t.timestamps
    end
  end
end
