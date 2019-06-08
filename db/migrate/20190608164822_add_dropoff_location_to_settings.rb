class AddDropoffLocationToSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :dropoff_location, :string
  end
end
