class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.datetime :placed_date, :null => true
      t.integer :mail_address_id
      t.integer :bill_address_id
      t.boolean :completed
      t.timestamps
    end
  end
end
