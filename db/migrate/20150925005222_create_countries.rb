class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, :limit => 32
      t.string :abbreviation, :limit => 3

      t.timestamps null: false
    end
  end
end
