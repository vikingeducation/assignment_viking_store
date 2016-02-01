class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line_1, null: false
      t.string :line_2
      t.string :city, null: false
      t.string :region, null: false
      t.string :country, null: false
      t.string :zip_code, null: false

      t.timestamps null: false
    end
  end
end
