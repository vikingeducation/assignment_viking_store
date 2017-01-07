class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :user
      t.string :street
      t.integer :city_id
      t.integer :state_id
      t.string :zip

      t.timestamps
    end
  end
end
