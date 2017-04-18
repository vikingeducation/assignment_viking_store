class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :line_1, :null => false
      t.string :line_2
      t.string :city, :null => false
      t.string :state, :null => false
      t.string :country, :null => false
      t.string :zip_code, :null => false
      t.boolean :is_default, :null => false

      t.timestamps
    end
  end
end
