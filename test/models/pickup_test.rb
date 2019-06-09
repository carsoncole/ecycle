require 'test_helper'

class PickupTest < ActiveSupport::TestCase
  test "creation of key" do
    pickup = create(:pickup)
    assert_not_nil pickup.key
  end

  test "presence of email" do
    pickup = build(:pickup,
        email: nil
      )
    assert_not pickup.save
  end
end
