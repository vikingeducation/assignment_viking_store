class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.integer :state_id

      t.timestamps null: false
    end
    add_foreign_key :cities, :states, index: true
  end
end
