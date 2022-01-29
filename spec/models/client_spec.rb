# == Schema Information
#
# Table name: clients
#
#  id          :bigint           not null, primary key
#  first_name  :string           not null
#  last_name   :string           not null
#  middle_name :string           not null
#  email       :string           not null
#  phone       :string           not null
#  birthday    :datetime         not null
#  notes       :text
#  image_url   :string           not null
#  rating      :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Client, type: :model do
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

    context 'when phone nil' do
      it { is_expected.to validate_presence_of :phone }
    end

    context 'when birthday nil' do
      it { is_expected.to validate_presence_of :birthday }
    end

    context 'when notes nil' do
      it { is_expected.to allow_value('', nil).for(:notes) }
    end

    context 'when image_url nil' do
      it { is_expected.to validate_presence_of :image_url }
    end
  end
end
