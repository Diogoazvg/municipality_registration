# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  # subject { build(:address) }

  context 'with validations' do
    it { is_expected.to validate_presence_of(:zip_code) }
    it { is_expected.to validate_presence_of(:address1) }
    it { is_expected.to validate_presence_of(:neighborhood) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:uf) }
  end
end
