class AddStreetAddressToDrivers < ActiveRecord::Migration[5.1]
  def change
    add_column :drivers, :street_address, :string
  end
end
