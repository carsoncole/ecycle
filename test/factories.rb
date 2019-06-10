FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
  end

  factory :setting do
    new_user_key { "abcd"}
    general_contact_email { Faker::Internet.unique.email }
    general_contact_name { Faker::Internet.unique.email }
    pickup_contact_email { Faker::Internet.unique.email }
    pickup_contact_name { Faker::Internet.unique.email }
    is_pickups_offered { true }
    is_pickup_signups_enabled { true }
    donations_enabled { true }
    event_date { Date.today + 1.month }
  end

  factory :driver do
    email { Faker::Internet.unique.email }
  end

  factory :pickup do
    email { Faker::Internet.unique.email }
    name { Faker::Name.name }
    street_address { Faker::Address.street_address }
  end
end
