class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :ap 
      t.string :bld , null: false
    
      t.string :street, null: false
      t.string :city, null: false
      t.string :state
      t.string :country, null: false
      t.string :zip, null: false
      


      t.timestamps null: false
    end
  end
end
