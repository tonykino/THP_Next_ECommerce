# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id         :bigint(8)        not null, primary key
#  total      :decimal(, )      not null
#  status     :integer          default("biding")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#

FactoryBot.define do
  factory :order do
    user
    total { Faker::Number.decimal(2) }
    status { Order.statuses.keys.sample }

    trait(:with_items) do
      after(:create) do |order|
        create_list(:item, Random.rand(1..9), orders: [order])
      end
    end
  end
end
