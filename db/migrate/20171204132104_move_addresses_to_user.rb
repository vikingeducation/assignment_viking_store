class MoveAddressesToUser < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :billing_address_id, :integer, :null => true
    add_column :users, :shipping_address_id, :integer, :null => true

    remove_column :addresses, :address_type_id, :integer
    remove_column :addresses, :default, :boolean

    drop_table :address_types
  end

  def down
    remove_column :users, :billing_address_id
    remove_column :users, :shipping_address_id

    add_column :addresses, :address_type_id, :integer
    add_column :addresses, :default, :boolean

    create_table :address_types do |t|
      t.string :name

      t.timestamps
    end

  end
end
