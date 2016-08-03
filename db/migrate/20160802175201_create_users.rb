class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name,  null: false
      t.string :email, null: false
      t.integer :default_ship_address_id
      t.integer :default_bill_address_id
      t.timestamps null: false
    end
  end
end
