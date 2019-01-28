# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'Profile Database' do
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:phone_number).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'validations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected. to validate_length_of(:first_name).is_at_least(2).is_at_most(100) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected. to validate_length_of(:last_name).is_at_least(2).is_at_most(100) }
    it { is_expected.to validate_presence_of(:phone_number) }
  end

  it 'is creatable' do
    expect{ create(:profile) }.to change(Profile, :count).by(1)
  end
end
