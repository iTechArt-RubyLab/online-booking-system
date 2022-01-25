require 'rails_helper'

describe 'Users API DELETE', type: :request do
  describe 'DELETE requests', type: :request do
    let(:user) { create(:user) }

    it 'deletes a user' do
      delete "/api/v1/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
