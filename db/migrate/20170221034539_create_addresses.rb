class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :full_name
      t.string :add_line1
      t.string :add_line2
      t.references :city, foreign_key: true
      t.references :state, foreign_key: true
      t.string :zip, null: false
      t.references :country, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
