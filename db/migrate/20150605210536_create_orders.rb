class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.datetime :order_date
    	t.integer :user_id
    	t.text :json_snippet

      t.timestamps null: false
    end
  end
end
