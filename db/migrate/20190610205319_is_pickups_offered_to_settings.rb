class IsPickupsOfferedToSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :is_pickups_offered, :boolean, default: true, null: false
    add_column :settings, :is_donations_offered, :boolean, default: true, null: false
  end
end
