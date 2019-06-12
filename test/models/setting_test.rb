class SettingTest < ActiveSupport::TestCase
  test "create a setting" do
    assert create(:setting)
  end

  test "check for brief marketing message" do
    setting = create(:setting)
    assert setting.brief_marketing_message.include? "Support Scouting!"
  end

  test "check for new user key" do
    setting = create(:setting)
    assert setting.new_user_key
  end

  test "setting new user key" do
    setting = build(:setting)
    assert setting.save
    setting.new_user_key = nil
    assert setting.valid?
    assert setting.new_user_key
  end
end