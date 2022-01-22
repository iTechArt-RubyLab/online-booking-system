require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(build(:random_service)).to be_valid
    end

    context 'when nil name' do
      subject { build(:random_service, :nil_name) }

      it { is_expected.not_to be_valid }
    end

    context 'when nil description' do
      subject { build(:random_service, :nil_description) }

      it { is_expected.not_to be_valid }
    end

    context 'when nil duration' do
      subject { build(:random_service, :nil_duration) }

      it { is_expected.not_to be_valid }
    end

    context 'when nil price' do
      subject { build(:random_service, :nil_price) }

      it { is_expected.not_to be_valid }
    end

    context 'when nil hidden_price' do
      subject { build(:random_service, :nil_hidden_price) }

      it { is_expected.not_to be_valid }
    end

    context 'when nil availability' do
      subject { build(:random_service, :nil_availability) }

      it { is_expected.not_to be_valid }
    end
  end
end
