require 'test_helper'

class PickupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index if logged in" do
    sign_in(create(:user))
    get pickups_url
    assert_response :success
  end

  test "should not get index if not logged in" do
    get pickups_url
    assert_redirected_to sign_in_url
  end

  # test "should get new" do
  #   get new_pickup_url
  #   assert_response :success
  # end

  # test "should create pickup" do
  #   assert_difference('Pickup.count') do
  #     post pickups_url, params: { pickup: { email: @pickup.email, name: @pickup.name, street_address: @pickup.street_address } }
  #   end

  #   assert_redirected_to pickup_url(Pickup.last)
  # end

  # test "should show pickup" do
  #   get pickup_url(@pickup)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_pickup_url(@pickup)
  #   assert_response :success
  # end

  # test "should update pickup" do
  #   patch pickup_url(@pickup), params: { pickup: { email: @pickup.email, name: @pickup.name, street_address: @pickup.street_address } }
  #   assert_redirected_to pickup_url(@pickup)
  # end

  # test "should destroy pickup" do
  #   assert_difference('Pickup.count', -1) do
  #     delete pickup_url(@pickup)
  #   end

  #   assert_redirected_to pickups_url
  # end
end
