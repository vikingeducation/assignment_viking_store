class AddZipToAdress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :zip, :string
  end
end
