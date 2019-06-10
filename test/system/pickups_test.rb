require "application_system_test_case"

class PickupsTest < ApplicationSystemTestCase
  
  setup do
    app_settings.update(pickups_start_at: Date.today - 1.day)
  end

  test "visiting root when pickups not offered" do
    app_settings.update(is_pickups_offered: false)
    visit root_url
    assert_not page.has_selector? "#schedule-a-pickup"
    assert page.has_no_selector? "#pickup-button"
  end

  test "visiting root when pickups offered" do
    app_settings.update(is_pickup_signups_enabled: true)
    visit root_url
    assert page.has_selector? "#schedule-a-pickup"
    assert page.has_selector? "#pickup-button"
  end

  test "visiting root when pickup signups not enabled" do
    app_settings.update(is_pickup_signups_enabled: false)
    visit root_url
    assert page.has_selector? "#schedule-a-pickup"
    assert_selector "#schedule-a-pickup", text: "Schedule a Pickup"
    assert page.has_content? "Sign-ups for pickups are not currently open."
    assert page.has_content? "Schedule a Pickup"
    assert page.has_no_selector? "#pickup-button"
  end

  test "visiting root when pickup signups enabled but pickups are over" do
    app_settings.update(is_pickup_signups_enabled: true, pickups_end_at: Time.now - 1.day)
    visit root_url
    assert page.has_selector? "#schedule-a-pickup"
    assert page.has_content? "Sign-ups for pickups are not currently open."
    assert page.has_no_selector? "#pickup-button"
  end
end
