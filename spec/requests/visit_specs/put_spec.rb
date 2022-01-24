require 'rails_helper'

describe 'PUT /api/v1/visits/:id' do
  let(:visit) { create(:random_visit) }
  let(:new_adress) { Faker::Address.full_address }

  before do
    put "/api/v1/visits/#{visit.id}", params: { visit: { adress: new_adress } }
  end

  include_examples 'response success status'

  it 'updates a visit' do
    expect(Visit.find(visit.id).adress).to eq(new_adress)
  end
end
