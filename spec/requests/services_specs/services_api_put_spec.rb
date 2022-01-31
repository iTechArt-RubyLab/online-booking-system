require 'rails_helper'

describe 'Services API PUT', type: :request do
  describe 'PUT requests', type: :request do
    let(:service) { create(:service) }
    let(:service_params) { { name: 'Test service' } }
    let(:service_params_invalid) { { name: '' } }

    it 'updates a service' do
      put "/api/v1/services/#{service.id}", params: service_params
      expect(response).to have_http_status(:success)
    end

    it 'does not update a service with invalid params' do
      put "/api/v1/services/#{service.id}", params: service_params_invalid
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
