class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.datetime :placed_time
      t.integer :billed_to_id

      t.timestamps
    end
  end
end
