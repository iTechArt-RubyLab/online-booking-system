require 'rails_helper'

RSpec.shared_examples "invalid professional" do |args|
  subject { FactoryBot.build(:professional, args[:field]=>args[:value]) }

  it { is_expected.to be_invalid }
end


RSpec.describe Professional, type: :model do
  describe  'validation' do
    context "presence with nil" do
      include_examples 'invalid professional', { field: 'salon_id', value: nil }
      include_examples 'invalid professional', { field: 'status', value: nil }
      include_examples 'invalid professional', { field: 'work_email', value: nil }
      include_examples 'invalid professional', { field: 'work_phone', value: nil }
      include_examples 'invalid professional', { field: 'rating', value: nil }
    end
  
    context "work email" do
      context "uniqnuess" do
        before { FactoryBot.create(:professional, work_email: 'something@gmail.com') }

        include_examples 'invalid professional', { field: 'work_email', value: 'Something@gmail.com' }
      end

      context 'format' do
        include_examples 'invalid professional', { field: 'work_email', value: 'Somethin.ggmail.com' }
      end
    end

    context 'work_phone' do
      include_examples 'invalid professional', { field: 'work_phone', value: '37 25 609-99-99' }
    end
  end
end
