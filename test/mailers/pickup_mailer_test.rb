require 'test_helper'

class PickupMailerTest < ActionMailer::TestCase
  test "pickup_scheduled" do
    pickup = create(:pickup)
    mail = PickupMailer.pickup_scheduled(pickup.id)
    assert_equal "Your eCycle pickup is scheduled", mail.subject 
    assert_equal [pickup.email], mail.to
    assert_match "Pickup Schedule", mail.body.encoded
  end

  test "admin_pickup_scheduled" do
    pickup = create(:pickup)
    mail = PickupMailer.admin_pickup_scheduled(pickup.id)
    assert_equal "Ecycle Pickup Scheduled: #{pickup.email}", mail.subject 
    assert mail.to.include? app_settings.general_contact_email
    assert_match "Pickup Scheduled", mail.body.encoded
  end
end
