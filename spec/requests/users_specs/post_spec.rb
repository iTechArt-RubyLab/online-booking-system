require 'rails_helper'

describe 'Users API POST', type: :request do
  let(:user) { create(:salon_owner) }
  let(:auth_headers) { user.create_new_auth_token }
  let(:professional) { create(:professional) }

  context 'with invalid params' do
    it 'returns an error' do
      post '/api/v1/users', params: { user: { first_name: nil } }, headers: auth_headers
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
