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

require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  subject do
    build(:order_item)
  end

  describe 'is creatable' do
    let(:order_item) { create(:order_item) }
    it { expect(order_item.id).not_to be_nil }
    it { expect(order_item.quantity).not_to be_nil }
  end

  describe "does not destroy 'parents' upon destruction" do
    let!(:order_item) { create(:order_item) }
    it { expect{ order_item.destroy }.to_not change(Order, :count) }
    it { expect{ order_item.destroy }.to_not change(Item, :count) }
  end

  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:item_id).of_type(:integer) }
    it { is_expected.to have_db_column(:order_id).of_type(:integer) }
    it { is_expected.to have_db_column(:quantity).of_type(:integer).with_options(default: 1) }
    it { is_expected.to have_db_column(:subtotal).of_type(:decimal).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'Validations' do
    # it { is_expected.to validate_presence_of(:quantity) }
    # it { is_expected.to validate_numericality_of(:quantity).only_integer.is_greater_than_or_equal_to(0) }
    # it { is_expected.to validate_presence_of(:subtotal) }
    # it { is_expected.to validate_numericality_of(:quantity) }
  end
end
