class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :city
      t.string :state
      t.string :zip
      t.string :address_line_1
      t.string :address_line_2

      t.timestamps
    end
  end
end
