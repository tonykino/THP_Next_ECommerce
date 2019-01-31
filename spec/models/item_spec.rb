# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  price       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Item, type: :model do
  subject do
    build(:item)
  end

  describe 'is creatable' do
    let(:item) { create(:item) }
    it { expect(item.id).not_to be_nil }
    it { expect(item.name).not_to be_nil }
  end

  describe 'with orders' do
    let!(:item) { create(:item, :with_orders) }
    it { expect(item.orders).not_to be_empty }
    it { expect(item.orders.first.id).not_to be_nil }
    it { expect(item.orders.first.items).to include(item) }

    it 'destroys its associated order_items upon destruction' do
      expect{ item.destroy }.to change(OrderItem, :count).from(item.orders.count).to(0)
    end

    it 'does not destroy associated items upon destruction' do
      expect{ item.destroy }.to_not change(Order, :count)
    end
  end

  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:price).of_type(:decimal) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(40) }
    it { is_expected.to validate_length_of(:description).is_at_least(2).is_at_most(400) }
  end
end
