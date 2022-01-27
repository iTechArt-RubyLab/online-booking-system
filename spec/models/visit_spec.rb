# == Schema Information
#
# Table name: visits
#
#  id         :bigint           not null, primary key
#  start_at   :datetime         not null
#  end_at     :datetime         not null
#  price      :integer          not null
#  adress     :text             not null
#  status     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.shared_examples 'to be invalid' do |factory_trait|
  subject { build(:random_visit, factory_trait) }

  it { is_expected.to be_invalid }
end

RSpec.describe Visit, type: :model do
  describe 'does not pass validations' do
    context 'when nil start_date' do
      include_examples 'to be invalid', :nil_start_at
    end

    context 'when nil end_date' do
      include_examples 'to be invalid', :nil_end_at
    end

    context 'when nil price' do
      include_examples 'to be invalid', :nil_price
    end

    context 'when nil adress' do
      include_examples 'to be invalid', :nil_adress
    end

    context 'when nil status' do
      include_examples 'to be invalid', :nil_status
    end
  end
end
