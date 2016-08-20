class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :first_name,    null: false
      t.string  :last_name,     null: false
      t.string  :email,         null: false, unique: true
      t.integer :shipping_id
      t.integer :billing_id
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
