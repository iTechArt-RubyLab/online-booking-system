require 'rails_helper'

describe 'SalonsSocialNetwork API', type: :request do
  describe 'PUT /update' do
    let(:salon) { create(:salon) }
    let(:social_network) { create(:social_network) }
    let(:salon_links) { create(:salons_social_network, salon_id: salon.id, social_network_id: social_network.id) }

    it 'updates the link' do
      put "/api/v1/salons/#{salon.id}/salons_social_networks/#{salon_links.id}",
          params: {
            salons_social_network: {
              social_network_id: social_network.id
            }
          }
      expect(response).to have_http_status(:success)
    end
  end
end