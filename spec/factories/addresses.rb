# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id                          :bigint(8)        not null, primary key
#  street_number               :integer
#  route                       :string
#  locality                    :string
#  administrative_area_level_1 :string
#  country                     :string
#  postal_code                 :integer
#  full_address                :string
#  user_id                     :bigint(8)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

FactoryBot.define do
  factory :address do
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
