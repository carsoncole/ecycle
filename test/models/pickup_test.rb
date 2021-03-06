require 'test_helper'

class PickupTest < ActiveSupport::TestCase
  test "should not save pickup without an email" do
    pickup = Pickup.new
    assert_not pickup.save
  end

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

  test "setting of pickup key" do
    pickup = create(:pickup)
    assert pickup.key
    pickup.key = nil
    assert pickup.valid?
    assert pickup.key
  end
end
