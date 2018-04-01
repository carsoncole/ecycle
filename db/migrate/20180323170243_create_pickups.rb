class CreatePickups < ActiveRecord::Migration[5.1]
  def change
    create_table :pickups do |t|
      t.string :name
      t.string :email
      t.string :street_address
      t.string :message
      t.integer :driver_id
      t.string :size
      t.string :key, null: false
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
