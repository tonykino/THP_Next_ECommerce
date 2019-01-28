# frozen_string_literal: true

class Adress < ApplicationRecord
  belongs_to :user
  validates :street_number, presence: true
  validates :route, presence: true
  validates :locality, presence: true
  validates :administrative_area_level_1, presence: true
  validates :country, presence: true
  validates :postal_code, presence: true
  validates :full_address, presence: true
end
