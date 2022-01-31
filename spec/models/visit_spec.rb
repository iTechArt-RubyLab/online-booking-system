# == Schema Information
#
# Table name: visits
#
#  id         :bigint           not null, primary key
#  start_at   :datetime         not null
#  end_at     :datetime         not null
#  price      :integer          not null
#  address    :text             not null
#  status     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  client_id  :integer          not null
#  salon_id   :integer          not null
#
require 'rails_helper'
RSpec.describe Visit, type: :model do
  describe 'does not pass validations' do
    context 'when nil start_date' do
      it { is_expected.to validate_presence_of :start_at }
    end

    context 'when nil end_date' do
      it { is_expected.to validate_presence_of :end_at }
    end

    context 'when nil price' do
      it { is_expected.to validate_presence_of :price }
    end

    context 'when nil adress' do
      it { is_expected.to validate_presence_of :address }
    end

    context 'when nil status' do
      it { is_expected.to validate_presence_of :status }
    end
  end

  describe 'associations' do
    context 'when belongs to client' do
      it { is_expected.to belong_to(:client) }
    end

    context 'when belongs to salon' do
      it { is_expected.to belong_to(:salon) }
    end

    context 'when has many visits_services' do
      it { is_expected.to have_many(:visits_services).dependent(:destroy) }
    end

    context 'when has many services' do
      it { is_expected.to have_many(:services) }
    end

    context 'when has many services through visits_services' do
      it { is_expected.to have_many(:services).through(:visits_services) }
    end
  end
end
