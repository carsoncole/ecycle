class AddSendAdminPickupNotificationsToSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :send_admin_pickup_notifications, :boolean
  end
end
