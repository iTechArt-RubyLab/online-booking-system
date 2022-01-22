require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'does not pass validations with' do
    context 'nil name' do
      subject { FactoryBot.build(:random_service, :nil_name) }

      it { is_expected.not_to be_valid }
    end

    context 'nil description' do
      subject { FactoryBot.build(:random_service, :nil_description) }

      it { is_expected.not_to be_valid }
    end

    context 'nil duration' do
      subject { FactoryBot.build(:random_service, :nil_duration) }

      it { is_expected.not_to be_valid }
    end

    context 'nil price' do
      subject { FactoryBot.build(:random_service, :nil_price) }

      it { is_expected.not_to be_valid }
    end

    context 'nil hidden_price' do
      subject { FactoryBot.build(:random_service, :nil_hidden_price) }

      it { is_expected.not_to be_valid }
    end

    context 'nil availability' do
      subject { FactoryBot.build(:random_service, :nil_availability) }

      it { is_expected.not_to be_valid }
    end
  end
end
