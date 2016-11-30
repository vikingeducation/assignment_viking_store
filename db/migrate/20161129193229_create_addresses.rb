class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street, :null => false
      t.string :zip, :null => false
      t.string :type, :null => false
      t.boolean :primary, :null => false

      t.timestamps
    end
  end
end
