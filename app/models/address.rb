# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id                          :bigint(8)        not null, primary key
#  street_number               :integer
#  route                       :string
#  locality                    :string
#  administrative_area_level_1 :string
#  country                     :string
#  postal_code                 :integer
#  full_address                :string
#  user_id                     :bigint(8)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

class Address < ApplicationRecord
  belongs_to :user
  validates :full_address, presence: true
end
