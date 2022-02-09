require 'rails_helper'

RSpec.describe 'Clients API PUT', type: :request do
  let(:user) { create(:user) }
  let(:client) { create(:client) }
  let(:auth_headers) { user.create_new_auth_token }

  describe 'PUT /api/v1/clients/:id' do
    context 'when the request is valid' do
      before do
        put "/api/v1/clients/#{client.id}", params: { client: attributes_for(:client, first_name: 'New Name') },
                                            headers: auth_headers
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the request is invalid' do
      before do
        put "/api/v1/clients/#{client.id}", params: { client: attributes_for(:client, first_name: nil) },
                                            headers: auth_headers
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/can't be blank/)
      end
    end
  end
end
