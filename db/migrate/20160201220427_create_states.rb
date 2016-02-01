class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name, null: false
      t.integer :country_id

      t.timestamps null: false
    end
    add_foreign_key :states, :countries, index: true
  end
end
