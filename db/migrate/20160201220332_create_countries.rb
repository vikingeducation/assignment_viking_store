class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, unique: true, null: false

      t.timestamps null: false
    end
  end
end
