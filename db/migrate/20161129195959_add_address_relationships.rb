class AddAddressRelationships < ActiveRecord::Migration[5.0]
  def change
    add_reference :addresses, :users, :foreign_key => true
    add_reference :cities, :states, :foreign_key => true
    add_reference :states, :countries, :foreign_key => true
    add_reference :addresses, :cities, :foreign_key => true
  end
end
