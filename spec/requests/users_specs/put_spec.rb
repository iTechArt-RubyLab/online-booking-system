require 'rails_helper'

describe 'Users API PUT', type: :request do
  let(:user) { create(:salon_owner) }
  let(:auth_headers) { user.create_new_auth_token }

  describe 'with valid params' do
    context 'with valid params' do
      it 'returns a success response' do
        put "/api/v1/users/#{user.id}", params: { user: { first_name: 'New First Name' } }, headers: auth_headers
        expect(response).to have_http_status(:success)
      end

      it 'updates the user' do
        put "/api/v1/users/#{user.id}", params: { user: { first_name: 'New First Name' } }, headers: auth_headers
        expect(user.reload.first_name).to eq('New First Name')
      end
    end
  end
end
