class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :user_id, null: false
      t.string :street_line_1, null: false
      t.string :street_line_2
      t.integer :city_id, null: false
      t.integer :state_id, null: false
      t.string :zip, null: false

      t.timestamps
    end
  end
end