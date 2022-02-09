require 'rails_helper'

describe 'Salons Social Network API POST', type: :request do
  let(:user) { create(:user) }
  let(:auth_headers) { user.create_new_auth_token }
  let(:salon) { create(:salon) }
  let(:social_network) { create(:social_network) }
  let(:salons_social_network) { create(:salons_social_network, salon: salon, social_network: social_network) }

  context 'when the request is invalid' do
    before do
      post "/api/v1/salons/#{salon.id}/salons_social_networks", params: { social_network_id: nil },
                                                                headers: auth_headers
    end

    it 'returns status code 422' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
