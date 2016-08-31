class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :line_1, null: false
      t.string :line_2
      t.integer :zip_code_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
