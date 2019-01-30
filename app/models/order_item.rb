# frozen_string_literal: true

# == Schema Information
#
# Table name: order_items
#
#  id         :bigint(8)        not null, primary key
#  item_id    :bigint(8)
#  order_id   :bigint(8)
#  quantity   :integer          default(1)
#  subtotal   :decimal(, )      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  before_validation :update_subtotal

  validates :quantity, presence: true,
                       numericality: { only_integer: true, greater_than_or_equal: 0 }
  validates :subtotal, presence: true,
                       numericality: true

  after_update :check_qty
  before_validation :update_subtotal

  private

    def check_qty
      destroy if quantity.zero?
    end

    def update_subtotal
      self.subtotal = quantity * item.price
    end
end
