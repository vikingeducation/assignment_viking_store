class AddDefaultUserIdAndTypeToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :default, :boolean
    add_column :addresses, :user_id, :integer
    add_column :addresses, :type, :string
  end
end
