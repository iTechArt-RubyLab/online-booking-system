require 'rails_helper'

describe 'SalonsSocialNetwork API', type: :request do
  describe 'POST /create' do
    let(:salon) { create(:salon) }
    let(:social_network) { create(:social_network) }

    it 'creates a new link' do
      post "/api/v1/salons/#{salon.id}/salons_social_networks",
           params: {
             salons_social_network: {
               social_network_id: social_network.id
             }
           }
      expect(response).to have_http_status(:success)
    end
  end
end