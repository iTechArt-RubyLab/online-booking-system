require 'rails_helper'

describe 'Salons API POST', type: :request do
  describe 'POST requests', type: :request do
    let(:salon) { build(:salon) }

    it 'creates a new salon' do
      post '/api/v1/salons', params: { salon: salon.attributes }
      expect(response).to have_http_status(:success)
    end
  end
end
