require 'rails_helper'

describe 'SalonsSocialNetwork API DELETE', type: :request do
  describe 'DELETE /destroy' do
    let(:salon) { create(:salon) }
    let(:social_network) { create(:social_network) }
    let(:salons_social_network) { create(:salons_social_network, salon: salon, social_network: social_network) }

    before do
      delete "/api/v1/salons/#{salon.id}/salons_social_networks/#{salons_social_network.id}"
    end

    include_examples 'success status'

    it 'deletes a salons_social_network' do
      expect(SalonsSocialNetwork.find_by(id: salons_social_network.id)).to be_nil
    end
  end
end
