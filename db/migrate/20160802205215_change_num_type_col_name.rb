class ChangeNumTypeColName < ActiveRecord::Migration
  def change
    remove_column :phone_nums, :type
    add_column :phone_nums, :num_type, :string
  end
end
