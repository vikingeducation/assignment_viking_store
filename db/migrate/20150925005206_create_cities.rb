class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, :limit => 32
      t.integer :state_id

      t.index :state_id

      t.timestamps null: false
    end
  end
end
