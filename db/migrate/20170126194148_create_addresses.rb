class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
		t.string :country
    	t.string :state
    	t.string :city
		t.string :zip
		t.string :street
		t.boolean :shipping_default
		t.boolean :billing_default

      	t.timestamps
    end
  end
end
