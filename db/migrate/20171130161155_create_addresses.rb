class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :address_type, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.boolean :default, null: false, default: false
      t.string :street_1, null: false, default: ''
      t.string :street_2, null: false, default: ''
      t.string :city, null: false, default: ''
      t.references :state, foreign_key: true, null: false
      t.string :zip, null: false, default: ''

      t.timestamps
    end
  end
end
