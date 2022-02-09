require 'rails_helper'

describe 'Salons API POST', type: :request do
  let(:salon) { build(:salon) }
  let(:salon_owner) { create(:salon_owner) }
  let(:salon_owner_auth_headers) { salon_owner.create_new_auth_token }

  describe 'POST /api/v1/salons' do
    it 'creates a new salon' do
      post '/api/v1/salons', params: { salon: salon.attributes }, headers: salon_owner_auth_headers
      expect(response).to have_http_status(:success)
    end
  end

  context 'when the request is invalid' do
    before do
      post '/api/v1/salons', params: { salon: attributes_for(:salon, name: nil) }, headers: salon_owner_auth_headers
    end

    it 'returns status code 422' do
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns a validation failure message' do
      expect(response.body).to match(/can't be blank/)
    end
  end
end
