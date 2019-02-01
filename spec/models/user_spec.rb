# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  admin                  :boolean          default(FALSE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    build(:user)
  end

  describe 'is creatable' do
    let(:user) { create(:user) }
    it { expect(user.id).not_to be_nil }
    it { expect(user.email).not_to be_nil }
  end

  describe 'with orders' do
    let(:user) { create(:user, :with_orders) }
    it { expect(user.orders).not_to be_empty }
    it { expect(user.orders.first.id).not_to be_nil }
    it { expect(user.orders.first.user).to eq(user) }

    it 'destroys its orders upon destruction' do
      expect{ user.destroy }.to change(Order, :count).from(user.orders.count).to(0)
    end
  end

  describe 'with addresses' do
    let(:user) { create(:user, :with_addresses) }
    it { expect(user.addresses).not_to be_empty }
    it { expect(user.addresses.first.id).not_to be_nil }
    it { expect(user.addresses.first.user).to eq(user) }

    it 'destroys its addresses upon destruction' do
      expect{ user.destroy }.to change(Address, :count).from(user.addresses.count).to(0)
    end
  end

  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(default: "", null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:admin).of_type(:boolean).with_options(default: "false", null: false) }

    it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:confirmation_token).of_type(:string) }
    it { is_expected.to have_db_column(:confirmed_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:confirmation_sent_at).of_type(:datetime) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end
end
