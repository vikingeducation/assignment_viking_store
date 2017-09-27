class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :billing_address
      t.references :shipping_address
      t.references :user, foreign_key: true
      t.references :cart, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
