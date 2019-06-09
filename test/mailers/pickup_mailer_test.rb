require 'test_helper'

class PickupMailerTest < ActionMailer::TestCase
  # test "pickup_scheduled" do
  #   mail = PickupMailer.pickup_scheduled
  #   assert_equal "Pickup scheduled", mail.subject
  #   assert_equal ["to@example.org"], mail.to
  #   assert_equal ["from@example.com"], mail.from
  #   assert_match "Hi", mail.body.encoded
  # end

  test "pickup_scheduled" do
    pickup = create(:pickup)
    mail = PickupMailer.pickup_scheduled(pickup.id)
    assert_equal "Your eCycle pickup is scheduled", mail.subject 
    assert_equal [pickup.email], mail.to
    assert_match "Pickup Schedule", mail.body.encoded
  end
end
