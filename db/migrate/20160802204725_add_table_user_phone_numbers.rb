class AddTableUserPhoneNumbers < ActiveRecord::Migration
  def change
    create_table :user_phone_numbers do |t|
      t.references :user
      t.references :phone_number
    end
    create_table :user_addresses do |t|
      t.references :user
      t.references :address
    end
    create_table :product_order do |t|
      t.references :product
      t.references :order
    end
  end
end
