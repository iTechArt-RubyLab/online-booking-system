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
end
