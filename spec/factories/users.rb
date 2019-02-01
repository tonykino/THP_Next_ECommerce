# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  admin                  :boolean          default(FALSE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

FactoryBot.define do
  factory :user do
    password_faker = Faker::Internet.password(8)
    email { Faker::Internet.email }
    password { password_faker }
    password_confirmation { password_faker }
    confirmed_at { Time.zone.now }

    trait(:with_orders) do
      after(:create) do |user|
        create_list(:order, Random.rand(1..9), user: user)
      end
    end

    trait(:with_addresses) do
      after(:create) do |user|
        create_list(:address, Random.rand(1..2), user: user)
      end
    end
  end
end
