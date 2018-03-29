class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.text :pickup_instructions, default: 'Boy Scouts from our Troop will be picking up between 8am and 2pm on Saturday, June 2. Please have your e-waste outside on your curb, house porch, or in front of your garage or front door.'
      t.boolean :pickup_signups_enabled, default: false
      t.string :contact_name
      t.string :contact_email

      t.timestamps
    end
  end
end
