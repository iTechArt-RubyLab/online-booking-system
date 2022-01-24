require 'rails_helper'

RSpec.describe Salon, type: :model do
  describe 'does not pass validations' do
    context 'when nil name' do
      include_examples 'to be invalid', :nil_name
    end

    context 'when nil address' do
      include_examples 'to be invalid', :nil_address
    end

    context 'when nil phone' do
      include_examples 'to be invalid', :nil_phone
    end

    context 'when nil email' do
      include_examples 'to be invalid', :nil_email
    end

    context 'when nil notes' do
      include_examples 'to be invalid', :nil_notes
    end
  end
end
