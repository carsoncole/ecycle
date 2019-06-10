class ChangeColumnIsPickupSignupsEnabled < ActiveRecord::Migration[5.2]
  def change
    rename_column :settings, :pickup_signups_enabled, :is_pickup_signups_enabled
  end
end
