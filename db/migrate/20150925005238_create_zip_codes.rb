class CreateZipCodes < ActiveRecord::Migration
  def change
    create_table :zip_codes do |t|
      t.string :code, :limit => 32
      t.integer :state_id

      t.index :state_id

      t.timestamps null: false
    end
  end
end
