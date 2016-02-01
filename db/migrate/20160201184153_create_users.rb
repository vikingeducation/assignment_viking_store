class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, unique: true
      t.string :phone_number

      t.integer :billing_address_id, index: true
      t.integer :shipping_address_id, index: true

      t.timestamps null: false
    end

    add_foreign_key :addresses, :users, column: :billing_address_id
    add_foreign_key :addresses, :users, column: :shipping_address_id
  end
end
