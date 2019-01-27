# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :phone_number, presence: true
end
