class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street_1, null: false
      t.string :street_2
      t.string :city, null: false
      t.string :state, null: false
      t.string :post_code, null: false
      t.string :plus_4
      t.string :country
      t.string :province
      t.datetime :deleted_at, default: nil

      t.timestamps
    end
  end
end
