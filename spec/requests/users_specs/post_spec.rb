require 'rails_helper'

describe 'Users API POST', type: :request do
  describe 'POST requests', type: :request do
    let(:user) { build(:user) }

    it 'creates a new user' do
      post '/api/v1/users', params: { user: user.attributes }
      expect(response).to have_http_status(:success)
    end
  end
end
