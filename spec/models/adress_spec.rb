# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Adress, type: :model do
  describe 'Adress Database' do
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
    it { is_expected.to validate_presence_of(:street_number) }
    it { is_expected.to validate_presence_of(:route) }
    it { is_expected.to validate_presence_of(:locality) }
    it { is_expected.to validate_presence_of(:administrative_area_level_1) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:postal_code) }
    it { is_expected.to validate_presence_of(:full_address) }
  end

  it 'is creatable' do
    expect{ create(:adress) }.to change(Adress, :count).by(1)
  end
end
