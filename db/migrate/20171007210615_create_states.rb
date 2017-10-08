class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.string :long_name, unique: true, null: false 
      t.string :abbr, unique: true, null: false

      t.timestamps
    end
  end
end
