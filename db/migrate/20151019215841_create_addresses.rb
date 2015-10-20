class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.integer :city_id
      t.integer :state_id
      t.integer :zip
      
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
