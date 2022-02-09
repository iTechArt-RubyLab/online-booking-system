require 'rails_helper'

describe 'Visit API DELETE', type: :request do
  let(:user) { create(:salon_owner) }
  let(:auth_headers) { user.create_new_auth_token }
  let(:client) { create(:client) }
  let(:service) { create(:service) }
  let(:visit) { create(:visit, client: client, service: service) }

  context 'with valid params' do
    it 'returns a success response' do
      delete "/api/v1/visits/#{visit.id}", headers: auth_headers
      expect(response).to have_http_status(:success)
    end

    it 'deletes the visit' do
      delete "/api/v1/visits/#{visit.id}", headers: auth_headers
      expect(Visit.count).to eq(0)
    end
  end
end
