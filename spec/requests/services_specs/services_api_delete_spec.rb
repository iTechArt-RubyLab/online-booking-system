require 'rails_helper'

describe 'Services API DELETE', type: :request do
  describe 'DELETE requests', type: :request do
    let(:service) { create(:random_service) }

    it 'deletes a service' do
      delete "/api/v1/services/#{service.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
