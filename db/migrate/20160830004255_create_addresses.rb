class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :line_1
      t.string :line_2
      t.integer :zip_code_id
      t.integer :user_id

      t.timestamps
    end
  end
end
