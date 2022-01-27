require 'rails_helper'

RSpec.describe 'SalonsSocialNetworks', type: :request do
  describe 'GET /index' do
    it 'returns all salon links' do
      get '/api/v1/salons/1/salons_social_networks'
      expect(response).to have_http_status(:success)
    end
  end
end
