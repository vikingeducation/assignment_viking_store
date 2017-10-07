class AddForeignKeyToAddress < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :addresses, :cities, column: :city_id, primary_key: :id
    add_foreign_key :addresses, :states, column: :state_id, primary_key: :id
  end
end
