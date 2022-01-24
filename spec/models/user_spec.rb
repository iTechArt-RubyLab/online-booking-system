require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'does not pass validations' do
    context 'when first_name nil' do
      include_examples 'to be invalid', :nil_first_name
    end

    context 'when last_name nil' do
      include_examples 'to be invalid', :nil_last_name
    end

    context 'when patronymic nil' do
      include_examples 'to be valid', :nil_patronymic
    end

    context 'when salon_id nil' do
      include_examples 'to be invalid', :nil_salon_id
    end

    context 'when email nil' do
      include_examples 'to be invalid', :nil_email
    end

    context 'when work_email nil' do
      include_examples 'to be invalid', :nil_work_email
    end

    context 'when phone nil' do
      include_examples 'to be invalid', :nil_phone
    end

    context 'when work_phone nil' do
      include_examples 'to be invalid', :nil_work_phone
    end

    context 'when birthday nil' do
      include_examples 'to be invalid', :nil_birthday
    end

    context 'when role nil' do
      include_examples 'to be invalid', :nil_role
    end

    context 'when status nil' do
      include_examples 'to be invalid', :nil_status
    end

    context 'when notes nil' do
      include_examples 'to be valid', :nil_notes
    end

    context 'when image_url nil' do
      include_examples 'to be invalid', :nil_image_url
    end
  end
end
