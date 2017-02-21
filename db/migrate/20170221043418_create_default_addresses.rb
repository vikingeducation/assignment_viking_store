class CreateDefaultAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :default_addresses do |t|
      t.references :user
      t.integer :billing_id, index: true, null:false, foreign_key: :address
      t.integer :shipping_id, index:true, null: false, foreign_key: :address

      t.timestamps
    end
  end
end
