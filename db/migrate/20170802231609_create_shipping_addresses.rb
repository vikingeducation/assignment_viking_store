class CreateShippingAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
