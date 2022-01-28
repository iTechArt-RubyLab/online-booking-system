require 'rails_helper'

describe 'Clients API', type: :request do
  describe 'PUT /update' do
    let(:client) { create(:client) }

    it 'updates the link' do
      put "/api/v1/clients/#{client.id}", params: { client: { img_url: 'http://www.google.com' } }
      expect(response).to have_http_status(:success)
    end
  end
end
