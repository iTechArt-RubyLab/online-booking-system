require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'does not pass validations' do
    context 'when first_name nil' do
      it { is_expected.to validate_presence_of :first_name }
    end

    context 'when last_name nil' do
      it { is_expected.to validate_presence_of :last_name }
    end

    context 'when middle_name nil' do
      it { is_expected.to allow_value('', nil).for(:middle_name) }
    end

    context 'when email nil' do
      it { is_expected.to validate_presence_of :email }
    end

    context 'when work_email nil' do
      it { is_expected.to validate_presence_of :work_email }
    end

    context 'when phone nil' do
      it { is_expected.to validate_presence_of :phone }
    end

    context 'when work_phone nil' do
      it { is_expected.to validate_presence_of :work_phone }
    end

    context 'when birthday nil' do
      it { is_expected.to validate_presence_of :birthday }
    end

    context 'when role nil' do
      it { is_expected.to validate_presence_of :role }
    end

    context 'when status nil' do
      it { is_expected.to validate_presence_of :status }
    end

    context 'when notes nil' do
      it { is_expected.to allow_value('', nil).for(:notes) }
    end

    context 'when image_url nil' do
      it { is_expected.to validate_presence_of :image_url }
    end
  end
end
