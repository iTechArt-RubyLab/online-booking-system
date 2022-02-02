require 'rails_helper'

describe 'post a visit route', type: :request do
  describe 'POST requests', type: :request do
    let(:visit) { build(:visit) }

    it 'creates a new visit' do
      post '/api/v1/visits', params: { visit: visit.attributes }
      expect(response).to have_http_status(:success)
    end
  end
end
