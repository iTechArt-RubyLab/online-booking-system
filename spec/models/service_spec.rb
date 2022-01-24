require 'rails_helper'

RSpec.shared_examples 'to be invalid' do |factory_trait|
  subject { build(:random_service, factory_trait) }

  it { is_expected.to be_invalid }
end

RSpec.describe Service, type: :model do
  describe 'does not pass validations' do
    context 'when name nil' do
      include_examples 'to be invalid', :no_name
    end

    context 'when description nil' do
      include_examples 'to be invalid', :no_description
    end

    context 'when duration nil' do
      include_examples 'to be invalid', :no_duration
    end

    context 'when price nil' do
      include_examples 'to be invalid', :no_price
    end

    context 'when hidden_price nil' do
      include_examples 'to be invalid', :no_hidden_price
    end

    context 'when availability nil' do
      include_examples 'to be invalid', :no_availability
    end
  end
end
