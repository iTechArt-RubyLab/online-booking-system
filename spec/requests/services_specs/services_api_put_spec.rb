require 'rails_helper'

describe 'Services API PUT', type: :request do
  describe 'PUT requests', type: :request do
    let(:service) { create(:service) }
    let(:service_params) { { service: { name: 'New name' } } }

    it 'updates an existing service' do
      put "/api/v1/services/#{service.id}", params: service_params
      expect(response).to have_http_status(:success)
    end
  end
end
