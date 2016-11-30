class MakeAddressSimpler < ActiveRecord::Migration[5.0]
  def change
    remove_reference :addresses, :cities, :foreign_key => true
  end
end
