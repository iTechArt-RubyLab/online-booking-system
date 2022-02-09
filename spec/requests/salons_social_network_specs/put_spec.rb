require 'rails_helper'

describe 'SalonsSocialNetwork API', type: :request do
  describe 'PUT /update' do
    let(:salon) { create(:salon) }
    let(:social_network) { create(:social_network) }
    let(:salons_social_network) { create(:salons_social_network, salon: salon, social_network: social_network) }
    let(:new_social_network) { create(:social_network) }
    let(:auth_headers) { create(:user).create_new_auth_token }

    before do
      put "/api/v1/salons/#{salon.id}/salons_social_networks/#{salons_social_network.id}",
          params: {
            salons_social_network: {
              social_network_id: new_social_network.id
            }
          }, headers: auth_headers
    end

    include_examples 'success status'

    it 'updates a salons_social_network' do
      expect(SalonsSocialNetwork.find_by(id: salons_social_network.id).social_network_id).to eq(new_social_network.id)
    end
  end
end
