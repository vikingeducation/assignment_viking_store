class CreateZipcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :zipcodes do |t|
      t.integer :code, null: false

      t.timestamps
    end
  end
end
