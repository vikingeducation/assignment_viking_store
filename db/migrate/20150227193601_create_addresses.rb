class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.integer :priority
      t.string :shipping_address
      t.string :billing_address

      t.timestamps null: false
    end
  end
end
