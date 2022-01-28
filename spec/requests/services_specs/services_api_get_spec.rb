require 'rails_helper'

describe 'Services API GET', type: :request do
  context 'when /services' do
    before do
      create_list(:random_service, 2)
      get '/api/v1/services'
    end

    it 'have http status success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all services' do
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  context 'when /services/:id' do
    let!(:service) { create(:random_service) }

    before { get "/api/v1/services/#{service.id}" }

    include_examples 'success status'

    it 'return right service' do
      expect(JSON.parse(response.body)['id']).to eq(service.id)
    end
  end
end
