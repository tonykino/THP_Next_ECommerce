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
    total { "9.99" }
    status { 1 }
  end
end
