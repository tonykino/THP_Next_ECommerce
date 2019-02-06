# frozen_string_literal: true

require 'faker'

User.destroy_all
Item.destroy_all

User.create!(
  email: 'client@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  confirmed_at: Time.zone.now,
)

User.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true,
  confirmed_at: Time.zone.now,
)

200.times do
  Item.create!(
    name: Faker::Food.fruits,
    description: Faker::Food.description,
    price: Faker::Number.decimal(2)
  )
end
