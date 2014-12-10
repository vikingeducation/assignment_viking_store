class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
    	t.integer	 	:order_id,	null: false
    	t.integer  	:price,			null: false
    	t.integer  	:quantity
    	t.boolean		:checked_out,	default: true,	null: false

      t.timestamps
    end
  end
end
