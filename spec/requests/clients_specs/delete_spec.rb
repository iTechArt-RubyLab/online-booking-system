require 'rails_helper'

describe 'Clients API DELETE', type: :request do
  let(:user) { create(:user) }
  let(:client) { create(:client) }
  let(:auth_headers) { user.create_new_auth_token }

  describe 'DELETE /api/v1/clients/:id' do
    context 'when the request is valid' do
      before { delete "/api/v1/clients/#{client.id}", headers: auth_headers }

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'deletes the client' do
        expect { Client.find(client.id) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
