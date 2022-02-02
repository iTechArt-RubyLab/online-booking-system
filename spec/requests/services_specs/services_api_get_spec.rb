require 'rails_helper'

describe 'Services API GET', type: :request do
  describe 'when /api/v1/services is requested' do
    let(:service) { create(:service) }
    let(:service_params) { { name: 'Test service' } }

    it 'returns all services' do
      get '/api/v1/services'
      expect(response).to have_http_status(:success)
    end

    it 'returns a service' do
      get "/api/v1/services/#{service.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
