require 'rails_helper'

describe 'Users API GET', type: :request do
  describe 'GET requests', type: :request do
    let(:user) { create(:salon_owner) }
    let(:auth_headers) { user.create_new_auth_token }
    let(:user_params) { { user: { first_name: 'New first name' } } }

    it 'gets an existing user' do
      get "/api/v1/users/#{user.id}", params: user_params, headers: auth_headers
      expect(response).to have_http_status(:success)
    end

    it 'gets an all users' do
      get '/api/v1/users', params: user_params, headers: auth_headers
      expect(response).to have_http_status(:success)
    end
  end
end
