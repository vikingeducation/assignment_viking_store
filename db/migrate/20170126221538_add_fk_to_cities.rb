class AddFkToCities < ActiveRecord::Migration[5.0]
  def change
  		add_foreign_key :cities, :states
  end
end
