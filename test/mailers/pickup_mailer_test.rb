require 'test_helper'

class PickupMailerTest < ActionMailer::TestCase
  test "pickup_scheduled" do
    mail = PickupMailer.pickup_scheduled
    assert_equal "Pickup scheduled", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
