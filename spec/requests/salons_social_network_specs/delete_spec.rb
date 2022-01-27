require 'rails_helper'

describe 'SalonsSocialNetwork API DELETE', type: :request do
  describe 'DELETE /destroy' do
    let(:salon_links) { create(:salons_social_network) }

    it 'delete the link when id is correct' do
      delete "/api/v1/salons/#{salon_links.salon_id}/salons_social_networks/#{salon_links.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
