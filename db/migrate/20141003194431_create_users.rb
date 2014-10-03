class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname, null: false
      t.string :lname, null: false
      t.string :email, null: false, index: true, unique: true
      t.integer :billing_id
      t.integer :shipping_id

      t.timestamps
    end
  end
end
