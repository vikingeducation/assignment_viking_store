class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street1
      t.string :street2
      t.string :state_or_province
      t.string :city
      t.integer :zip

      t.timestamps
    end
  end
end
