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
#  user_id    :bigint(8)
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  subject do
    build(:order)
  end

  describe 'is creatable' do
    let(:order) { create(:order) }
    it { expect(order.id).not_to be_nil }
    it { expect(order.status).not_to be_nil }
  end

  describe 'with items' do
    let!(:order) { create(:order, :with_items) }
    it { expect(order.items).not_to be_empty }
    it { expect(order.items.first.id).not_to be_nil }
    it { expect(order.items.first.orders).to include(order) }

    it 'destroys its associated order_items upon destruction' do
      expect{ order.destroy }.to change(OrderItem, :count).from(order.items.count).to(0)
    end

    it 'does not destroy associated items upon destruction' do
      expect{ order.destroy }.to_not change(Item, :count)
    end
  end

  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:total).of_type(:decimal).with_options(null: false) }
    it { is_expected.to have_db_column(:status).of_type(:integer).with_options(default: "biding") }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:status) }
    # it { is_expected.to validate_presence_of(:total) }
    # it { is_expected.to validate_numericality_of(:total) }
  end
end
