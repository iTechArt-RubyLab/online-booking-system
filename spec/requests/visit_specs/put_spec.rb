require 'rails_helper'

describe 'PUT /api/v1/visits/:id' do
  let(:visit) { create(:visit) }
  let(:new_address) { Faker::Address.full_address }

  before do
    put "/api/v1/visits/#{visit.id}", params: { visit: { address: new_address } }
  end

  include_examples 'success status'

  it 'updates a visit' do
    expect(Visit.find(visit.id).address).to eq(new_address)
  end
end
