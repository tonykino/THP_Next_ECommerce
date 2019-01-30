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
                       numericality: { only_integer: true, greater_than: 0 }
  validates :subtotal, presence: true,
                       numericality: true

  before_save :update_subtotal

  private

    def update_subtotal
      self.subtotal = quantity * item.price
    end
end
