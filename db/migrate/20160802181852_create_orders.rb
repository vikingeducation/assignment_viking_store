class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true, null: false
      t.date :processed_date
      t.string :shipping_address
      t.string :billing_address
      t.timestamps
    end
  end
end
