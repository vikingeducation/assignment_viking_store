class ChangeExpirationDateType < ActiveRecord::Migration[5.0]
  def change
  		add_column :payments, :expiration_date, :datetime
  end
end
