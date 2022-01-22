require 'rails_helper'

RSpec.describe Salon, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(build(:random_salon)).to be_valid
    end

    context 'when nil name' do
      subject { build(:random_salon, :nil_name) }

      it { is_expected.not_to be_valid }
    end

    context 'when nil address' do
      subject { build(:random_salon, :nil_address) }

      it { is_expected.not_to be_valid }
    end

    context 'when nil phone' do
      subject { build(:random_salon, :nil_phone) }

      it { is_expected.not_to be_valid }
    end

    context 'when nil email' do
      subject { build(:random_salon, :nil_email) }

      it { is_expected.not_to be_valid }
    end

    context 'when nil notes' do
      subject { build(:random_salon, :nil_notes) }

      it { is_expected.to be_valid }
    end
  end
end
