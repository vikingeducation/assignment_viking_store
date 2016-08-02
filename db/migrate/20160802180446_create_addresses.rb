class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id, null: false
      t.string :num_street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false
      t.string :zip, null: false
      t.boolean :shipping, null: false
      t.boolean :billing, null: false
      t.timestamps null: false
    end
  end
end
