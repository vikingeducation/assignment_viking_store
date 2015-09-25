class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :post_office_box
      t.integer :city_id
      t.integer :state_id
      t.integer :zip_code_id
      t.integer :country_id

      t.index :city_id
      t.index :state_id
      t.index :zip_code_id
      t.index :country_id

      t.timestamps null: false
    end
  end
end
