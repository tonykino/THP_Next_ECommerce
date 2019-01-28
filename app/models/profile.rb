# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id           :bigint(8)        not null, primary key
#  first_name   :string
#  last_name    :string
#  phone_number :string
#  user_id      :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :phone_number, presence: true
end
