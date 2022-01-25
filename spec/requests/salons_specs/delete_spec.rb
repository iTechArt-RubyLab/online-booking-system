require 'rails_helper'

describe 'Salons API DELETE', type: :request do
  describe 'DELETE requests', type: :request do
    let(:salon) { create(:random_salon) }

    it 'deletes a salon' do
      delete "/api/v1/salons/#{salon.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
