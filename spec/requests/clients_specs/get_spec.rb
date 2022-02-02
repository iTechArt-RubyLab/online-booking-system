require 'rails_helper'

RSpec.describe 'Clients', type: :request do
  describe 'GET /index' do
    it 'returns all clients' do
      get '/api/v1/clients'
      expect(response).to have_http_status(:success)
    end
  end
end
