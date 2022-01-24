require 'rails_helper'

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
