# frozen_string_literal: true

FactoryBot.define do
  factory :profil do
    first_name { "MyString" }
    last_name { "MyString" }
    phone_number { "MyString" }
    user { nil }
  end
end
