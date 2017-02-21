class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string :name, null: false
      t.string :abbr

      t.timestamps
    end
  end
end
