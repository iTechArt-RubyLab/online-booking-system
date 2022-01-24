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

    context 'when hidden_price nil' do
      it { is_expected.to validate_presence_of :hidden_price }
    end

    context 'when availability nil' do
      it { is_expected.to validate_presence_of :availability }
    end
  end
end
