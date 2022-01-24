require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'does not pass validations' do
    context 'when name nil' do
      include_examples 'to be invalid', :nil_name
    end

    context 'when description nil' do
      include_examples 'to be invalid', :nil_description
    end

    context 'when duration nil' do
      include_examples 'to be invalid', :nil_duration
    end

    context 'when price nil' do
      include_examples 'to be invalid', :nil_price
    end

    context 'when hidden_price nil' do
      include_examples 'to be invalid', :nil_hidden_price
    end

    context 'when availability nil' do
      include_examples 'to be invalid', :nil_availability
    end
  end
end
