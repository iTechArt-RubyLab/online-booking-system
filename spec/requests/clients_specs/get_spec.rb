require 'rails_helper'

RSpec.describe 'Clients', type: :request do
  let(:user) { create(:user) }
  let(:client) { create(:client) }
  let(:auth_headers) { user.create_new_auth_token }

  describe 'GET /index' do
    context 'when the request is valid' do
      before { get '/api/v1/clients', headers: auth_headers }

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns all clients' do
        expect(JSON.parse(response.body).size).to eq(1)
      end
    end
  end

  describe 'GET /show' do
    context 'when the request is valid' do
      before { get "/api/v1/clients/#{client.id}", headers: auth_headers }

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns the client' do
        expect(response.body).to match(client.first_name)
      end
    end
  end
end
