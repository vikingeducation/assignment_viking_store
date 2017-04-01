class CreateAddressTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :address_types do |t|
      t.string :description, null: false, unique: true

      t.timestamps
    end
  end
end
