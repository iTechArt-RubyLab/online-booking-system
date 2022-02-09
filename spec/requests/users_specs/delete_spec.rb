require 'rails_helper'

describe 'Users API Delete', type: :request do
  let(:user) { create(:user) }
  let(:auth_headers) { user.create_new_auth_token }
  let(:user_params) { { user: { first_name: 'New first name' } } }

  it 'professional cant delete an existing user' do
    delete "/api/v1/users/#{user.id}", params: user_params, headers: auth_headers
    expect(response).to have_http_status(:forbidden)
  end
end
