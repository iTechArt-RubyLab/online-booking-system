require 'rails_helper'

describe 'PUT /api/v1/visits/:id' do
  let(:user) { create(:salon_owner) }
  let(:auth_headers) { user.create_new_auth_token }
  let(:client) { create(:client) }
  let(:service) { create(:service) }
  let(:visit) { create(:visit, client: client, service: service) }

  describe 'with valid params' do
    it 'returns a success response' do
      put "/api/v1/visits/#{visit.id}", params: { visit: { client_id: client.id, service_id: service.id } },
                                        headers: auth_headers
      expect(response).to have_http_status(:success)
    end

    it 'updates the visit' do
      put "/api/v1/visits/#{visit.id}", params: { visit: { client_id: client.id, service_id: service.id } },
                                        headers: auth_headers
      expect(visit.reload.client_id).to eq(client.id)
    end
  end
end
