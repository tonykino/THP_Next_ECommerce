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

require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'Address Database' do
    it { is_expected.to have_db_column(:street_number).of_type(:integer) }
    it { is_expected.to have_db_column(:route).of_type(:string) }
    it { is_expected.to have_db_column(:locality).of_type(:string) }
    it { is_expected.to have_db_column(:administrative_area_level_1).of_type(:string) }
    it { is_expected.to have_db_column(:country).of_type(:string) }
    it { is_expected.to have_db_column(:postal_code).of_type(:string) }
    it { is_expected.to have_db_column(:full_address).of_type(:text) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'validations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_presence_of(:full_address) }
  end

  it 'is creatable' do
    expect{ create(:address) }.to change(Address, :count).by(1)
  end
end
