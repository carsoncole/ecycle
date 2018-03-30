class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.string :customer_id
      t.string :customer_email
      t.string :stripe_payment_token
      t.string :charge_id
      t.integer :charge_amount
      t.string :charge_description
      t.boolean :charge_paid
      t.integer :pickup_id

      t.timestamps
    end
  end
end