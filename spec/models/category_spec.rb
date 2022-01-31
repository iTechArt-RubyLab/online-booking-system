require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'does not pass validations' do
    context 'when name nil' do
      it { is_expected.to validate_presence_of :name }
    end

    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(255) }
  end
end
