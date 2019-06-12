require 'test_helper'

class ChargeTest < ActiveSupport::TestCase
  test "a new donation charge" do
    donation = create(:charge)
    assert donation.pickup
  end
end
