class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.integer :pickup_id
      t.decimal :amount, scale: 7, precision: 2, default: 0.0

      t.timestamps
    end
  end
end
