# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  first_name             :string           not null
#  last_name              :string           not null
#  middle_name            :string
#  email                  :string           not null
#  work_email             :string
#  phone                  :string           not null
#  work_phone             :string
#  birthday               :datetime         not null
#  role                   :integer          default("professional"), not null
#  status                 :integer          default("working")
#  notes                  :text
#  rating                 :integer          default(0)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE)
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  tokens                 :json
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

    context 'when rating nil' do
      it { is_expected.to allow_value(0).for(:rating) }
    end

    context 'when avatar nil' do
      it { is_expected.to validate_presence_of :avatar }
    end
  end
end
