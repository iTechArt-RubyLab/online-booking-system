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
end
