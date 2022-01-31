# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  first_name  :string           not null
#  last_name   :string           not null
#  middle_name :string
#  email       :string           not null
#  work_email  :string
#  phone       :string           not null
#  work_phone  :string
#  birthday    :datetime         not null
#  role        :integer          default("professional"), not null
#  status      :integer          default("working")
#  notes       :text
#  image_url   :string           not null
#  rating      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
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
      it { is_expected.to allow_value('', nil).for(:work_email) }
    end

    context 'when phone nil' do
      it { is_expected.to validate_presence_of :phone }
    end

    context 'when work_phone nil' do
      it { is_expected.to allow_value('', nil).for(:work_phone) }
    end

    context 'when birthday nil' do
      it { is_expected.to validate_presence_of :birthday }
    end

    context 'when role nil' do
      it { is_expected.to validate_presence_of :role }
    end

    context 'when status nil' do
      it { is_expected.to allow_value(0).for(:status) }
    end

    context 'when notes nil' do
      it { is_expected.to allow_value('', nil).for(:notes) }
    end

    context 'when image_url nil' do
      it { is_expected.to validate_presence_of :image_url }
    end

    context 'when rating nil' do
      it { is_expected.to allow_value(0).for(:rating) }
    end
  end
end
