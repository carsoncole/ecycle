require 'test_helper'

class ChargesControllerTest < ActionDispatch::IntegrationTest
  test "should get index if logged in" do
    sign_in(create(:user))
    get charges_url
    assert_response :success
  end

  test "should not get index if not logged in" do
    get charges_url
    assert_redirected_to sign_in_url
  end
end
