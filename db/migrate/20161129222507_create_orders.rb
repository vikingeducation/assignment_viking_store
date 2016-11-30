class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.boolean :open

      t.timestamps
    end
  end
end
