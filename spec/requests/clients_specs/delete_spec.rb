require 'rails_helper'

describe 'Clients API DELETE', type: :request do
  describe 'DELETE /destroy' do
    let!(:client) { create(:client) }

    it 'delete the client when id is correct' do
      delete "/api/v1/clients/#{client.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
