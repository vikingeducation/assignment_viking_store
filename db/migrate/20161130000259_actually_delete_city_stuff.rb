class ActuallyDeleteCityStuff < ActiveRecord::Migration[5.0]
  def change
    drop_table :cities
    drop_table :states
    drop_table :countries
  end
end
