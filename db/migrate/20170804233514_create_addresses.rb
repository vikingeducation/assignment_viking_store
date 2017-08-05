class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.integer :city_id
      t.integer :state_id
      t.integer :user_id

      t.timestamps
    end
  end
end
