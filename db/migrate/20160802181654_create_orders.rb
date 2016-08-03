class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.references :cart, foreign_key: true
      t.datetime :delivered_at

      t.timestamps
    end
  end
end
