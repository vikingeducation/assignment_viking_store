class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.references :city, null: false
      t.string :zip, null: false
      t.string :address_line_1, null: false
      t.string :address_line_2

      t.timestamps
    end
  end
end
