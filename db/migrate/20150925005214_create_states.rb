class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name, :limit => 32
      t.string :abbreviation, :limit => 2
      t.integer :country_id

      t.index :country_id

      t.timestamps null: false
    end
  end
end
