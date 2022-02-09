require 'rails_helper'

describe 'Visits API GET', type: :request do
  let(:user) { create(:salon_owner) }
  let(:auth_headers) { user.create_new_auth_token }
  let(:client) { create(:client) }
  let(:service) { create(:service) }
  let(:visit) { create(:visit, client: client, service: service) }

  context 'with valid params' do
    it 'returns a success response' do
      get "/api/v1/visits/#{visit.id}", headers: auth_headers
      expect(response).to have_http_status(:success)
    end

    it 'returns all visits' do
      get '/api/v1/visits', headers: auth_headers
      expect(response).to have_http_status(:success)
    end
  end
end
