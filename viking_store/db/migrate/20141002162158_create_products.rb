class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string 	:title
    	t.text		:description
    	t.string	:price
    	t.string	:sku_num
    	# method to add category_id ref

      t.timestamps
    end
  end
end
