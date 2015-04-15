class CreateBillingAddresses < ActiveRecord::Migration
  def change
    create_table :billing_addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
