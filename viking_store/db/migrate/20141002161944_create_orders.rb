class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	# method for generating user_id ref
    	
      t.timestamps
    end
  end
end
