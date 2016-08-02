class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.boolean :is_primary, default: false
      t.boolean :is_shipping, default: false
      t.boolean :is_billing, default: false
      t.string :street_number
      t.string :street_name
      t.string :city
      t.string :state
      t.string :country
      t.timestamps
    end
  end
end
