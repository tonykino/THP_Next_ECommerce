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
#

class Order < ApplicationRecord
  enum status: %i[biding validated treated]
end
