class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :abbr

      t.timestamps null: false
    end

    remove_column :locations, :state
    remove_column :locations, :city
    add_column :locations, :city_id, :integer
  end
end
