# frozen_string_literal: true

# == Schema Information
#
# Table name: profils
#
#  id           :bigint(8)        not null, primary key
#  first_name   :string
#  last_name    :string
#  phone_number :string
#  user_id      :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :profil do
    first_name { "MyString" }
    last_name { "MyString" }
    phone_number { "MyString" }
    user { nil }
  end
end
