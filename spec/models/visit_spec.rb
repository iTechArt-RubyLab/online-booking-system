require 'rails_helper'

RSpec.describe Visit, type: :model do
  describe 'does not pass validations with' do
    context 'nil start_date' do
      subject { build(:random_visit, :nil_start_at) }

      it { is_expected.not_to be_valid }
    end

    context 'nil end_date' do
      subject { build(:random_visit, :nil_end_at) }

      it { is_expected.not_to be_valid }
    end

    context 'nil price' do
      subject { build(:random_visit, :nil_price) }

      it { is_expected.not_to be_valid }
    end

    context 'nil adress' do
      subject { build(:random_visit, :nil_adress) }

      it { is_expected.not_to be_valid }
    end

    context 'nil status' do
      subject { build(:random_visit, :nil_status) }

      it { is_expected.not_to be_valid }
    end
  end
end
