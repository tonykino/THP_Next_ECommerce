# frozen_string_literal: true

# == Schema Information
#
# Table name: order_items
#
#  id         :bigint(8)        not null, primary key
#  item_id    :bigint(8)
#  order_id   :bigint(8)
#  quantity   :integer          default(1)
#  subtotal   :decimal(, )      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :order_item do
    item
    order
    quantity { Faker::Number.non_zero_digit }
    subtotal { Faker::Number.decimal(2, 2) }
  end
end
