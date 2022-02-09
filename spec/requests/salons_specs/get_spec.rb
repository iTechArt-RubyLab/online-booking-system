require 'rails_helper'

describe 'Salons API GET', type: :request do
  let(:salon1) { create(:salon) }
  let(:salon_owner) { create(:salon_owner) }
  let(:salon_owner_auth_headers) { salon_owner.create_new_auth_token }

  describe 'GET /api/v1/salons' do
    before { get '/api/v1/salons', headers: salon_owner_auth_headers }

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns 1 salon' do
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end
end
