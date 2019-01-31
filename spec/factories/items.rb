# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  price       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters(Random.rand(2..40)) }
    description { Faker::Lorem.sentence }
    price { Faker::Number.decimal(2, 2) }

    trait(:with_orders) do
      after(:create) do |item|
        create_list(:order, Random.rand(1..9), items: [item])
      end
    end
  end
end
