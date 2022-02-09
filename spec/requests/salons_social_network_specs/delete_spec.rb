require 'rails_helper'

describe 'Salons Social Network API DELETE', type: :request do
  let(:user) { create(:user) }
  let(:salon) { create(:salon) }
  let(:auth_headers) { user.create_new_auth_token }
  let(:social_network) { create(:social_network) }
  let(:salons_social_network) { create(:salons_social_network, salon: salon, social_network: social_network) }

  before do
    salons_social_network
  end

  context 'when user is authenticated' do
    before do
      delete "/api/v1/salons/#{salon.id}/salons_social_networks/#{salons_social_network.id}",
             headers: auth_headers
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'deletes the salon social network' do
      expect(SalonsSocialNetwork.count).to eq(0)
    end
  end

  context 'when user is not authenticated' do
    before do
      delete "/api/v1/salons/#{salon.id}/salons_social_networks/#{salons_social_network.id}"
    end

    it 'returns status code 401' do
      expect(response).to have_http_status(:unauthorized)
    end

    it 'does not delete the salon social network' do
      expect(SalonsSocialNetwork.count).to eq(1)
    end
  end
end
