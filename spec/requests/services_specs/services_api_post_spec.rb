require 'rails_helper'

describe 'Services API POST', type: :request do
  describe 'POST requests', type: :request do
    let(:service) { build(:service) }

    it 'creates a new service' do
      post '/api/v1/services', params: { service: service.attributes }
      expect(response).to have_http_status(:success)
    end
  end
end
