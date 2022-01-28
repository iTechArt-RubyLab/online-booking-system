require 'rails_helper'

describe 'Clients API', type: :request do
  describe 'POST /create' do
    let(:client) { build(:client) }

    it 'creates a new link' do
      post '/api/v1/clients', params: { client: client.attributes }
      expect(response).to have_http_status(:success)
    end
  end
end
