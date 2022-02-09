require 'rails_helper'

describe 'post a visit route', type: :request do
  let(:user) { create(:salon_owner) }
  let(:auth_headers) { user.create_new_auth_token }
  let(:client) { create(:client) }
  let(:service) { create(:service) }
  let(:visit) { create(:visit, client: client, service: service) }

  context 'with invalid params' do
    it 'returns a success response' do
      post '/api/v1/visits', params: { visit: { client_id: nil, service_id: nil } }, headers: auth_headers
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'when not authenticated' do
    it 'returns a success response' do
      post '/api/v1/visits', params: { visit: { client_id: client.id, service_id: service.id } }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
