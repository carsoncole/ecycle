require 'test_helper'

class DriverTest < ActiveSupport::TestCase
  test "driver can be created" do
    assert create(:driver)
  end

  test "driver can not be saved without email" do
    driver = build(:driver, email: nil)
    assert_not driver.save
  end

  test "driver can not be saved without name" do
    driver = build(:driver, name: nil)
    assert_not driver.save
  end
end
