# frozen_string_literal: true

FactoryBot.define do
  factory :adress do
    street_number { Faker::Number.between(1, 100) }
    route { Faker::Address.street_name }
    locality { Faker::Address.city }
    administrative_area_level_1 { Faker::Address.state }
    country { Faker::Address.country }
    postal_code { Faker::Number.number(5) }
    full_address { Faker::Address.full_address }
    association :user
  end
end
