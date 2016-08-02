class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :user_id
      t.string :state
      t.string :zip
      t.string :street
      t.string :city

      t.timestamps null: false
    end
  end
end
