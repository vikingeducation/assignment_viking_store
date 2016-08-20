class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :province
      t.string :city
      t.string :postcode
      t.string :address_1
      t.string :address_2
      t.boolean :shipping_default
      t.boolean :billing_default

      t.timestamps
    end

    add_reference :addresses, :user_detail, index: true
    add_foreign_key :addresses, :user_details
  end
end
