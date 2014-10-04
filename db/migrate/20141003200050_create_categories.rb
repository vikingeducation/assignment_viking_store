class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      # t.integer :product_id - unnecessary
      t.string :name, index: true, unique: true
      t.text :description

      t.timestamps
    end
  end
  def 

  end
end
