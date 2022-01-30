# == Schema Information
#
# Table name: salons
#
#  id             :bigint           not null, primary key
#  name           :string           not null
#  address        :text             not null
#  phone          :string           not null
#  email          :string           default(""), not null
#  notes          :text             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  salon_owner_id :integer          not null
#
require 'rails_helper'

RSpec.describe Salon, type: :model do
  describe 'does not pass validations' do
    context 'when nil name' do
      it { is_expected.to validate_presence_of :name }
    end

    context 'when nil address' do
      it { is_expected.to validate_presence_of :address }
    end

    context 'when nil phone' do
      it { is_expected.to validate_presence_of :phone }
    end

    context 'when nil email' do
      it { is_expected.to validate_presence_of :email }
    end

    context 'when nil notes' do
      it { is_expected.to validate_presence_of :notes }
    end
  end

  describe 'associations' do
    context 'when has many services' do
      it { is_expected.to have_many(:services) }
    end

    context 'when has many salons_social_networks' do
      it { is_expected.to have_many(:salons_social_networks) }
    end

    context 'when has many visits' do
      it { is_expected.to have_many(:visits) }
    end

    context 'when belongs to salon_owner' do
      it { is_expected.to belong_to(:salon_owner) }
    end

    context 'when has many professionals_salons' do
      it { is_expected.to have_many(:professionals_salons) }
    end

    context 'when has many professionals' do
      it { is_expected.to have_many(:professionals) }
    end

    context 'when has many social_networks' do
      it { is_expected.to have_many(:social_networks) }
    end
  end
end
