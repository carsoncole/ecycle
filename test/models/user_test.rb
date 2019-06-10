class UserTest < ActiveSupport::TestCase
  test "creating a user" do
    assert create(:user, password: Faker::Name.name)
  end
end