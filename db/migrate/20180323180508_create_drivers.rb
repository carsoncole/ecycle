class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :email
      t.string :scout_names
      t.string :street_address

      t.timestamps
    end
  end
end
