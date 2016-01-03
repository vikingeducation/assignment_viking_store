class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false, :unique => true
      t.string :description

      t.timestamps null: false
    end
  end
end
