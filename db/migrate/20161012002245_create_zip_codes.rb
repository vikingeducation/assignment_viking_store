class CreateZipCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :zip_codes do |t|
      t.integer :code, null: false

      t.timestamps
    end
  end
end
