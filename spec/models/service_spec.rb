# == Schema Information
#
# Table name: services
#
#  id           :bigint           not null, primary key
#  salon_id     :integer          not null
#  name         :string           not null
#  description  :text             not null
#  duration     :integer          default(1), not null
#  price        :integer          default(1), not null
#  availability :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :bigint           not null
#
require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'does not pass validations' do
    context 'when name nil' do
      it { is_expected.to validate_presence_of :name }
    end

    context 'when description nil' do
      it { is_expected.to validate_presence_of :description }
    end

    context 'when duration nil' do
      it { is_expected.to validate_presence_of :duration }
    end

    context 'when price nil' do
      it { is_expected.to validate_presence_of :price }
    end

    context 'when availability nil' do
      it { is_expected.to validate_presence_of :availability }
    end
  end

  describe 'associations' do
    context 'when belongs to salon' do
      it { is_expected.to belong_to(:salon) }
    end
  end
end
