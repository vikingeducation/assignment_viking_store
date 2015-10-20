class UniqueState < ActiveRecord::Migration
  def change
    add_index :states, :name, unique: true
  end
end
