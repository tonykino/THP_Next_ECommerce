# frozen_string_literal: true

User.destroy_all

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
