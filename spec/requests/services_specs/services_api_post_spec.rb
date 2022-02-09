require 'rails_helper'

describe 'Services API POST', type: :request do
  let(:user) { create(:salon_owner) }
  let(:auth_headers) { user.create_new_auth_token }

  let(:service) { build(:service) }
  let(:service_params) do
    Service.new(salon_id: 3, name: 'Haircut', price: '10.00', duration: '30 minutes', description: 'A great haircut',
                category_id: 1, availability: 'no')
  end

  describe 'POST requests', type: :request do
    it 'creates a new service' do
      post '/api/v1/services', params: { service: service_params.attributes }, headers: auth_headers
    end
  end
end
