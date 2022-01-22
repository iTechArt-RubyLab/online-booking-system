require 'rails_helper'

describe 'Services API', type: :request do
  describe 'GET /services' do
    it 'returns all services' do
      FactoryBot.create(:random_service)
      FactoryBot.create(:random_service)

      get '/api/v1/services'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it 'return one service' do
      service = FactoryBot.create(:random_service)

      get "/api/v1/services/#{service.id}"

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['name']).to eq(service.name)
    end
  end

  describe 'POST requests', type: :request do
    before do
      post '/api/v1/services',
           params: { service:
                     { category_id: 1,
                       salon_id: 1,
                       name: 'a_service',
                       description: 'a_description',
                       duration: 180,
                       price: 1,
                       hidden_price: 1,
                       availability: 'no' } }
    end

    it 'returns the service name' do
      expect(JSON.parse(response.body)['name']).to eq('a_service')
    end

    it 'returns the service description' do
      expect(JSON.parse(response.body)['description']).to eq('a_description')
    end

    it 'returns the service duration' do
      expect(JSON.parse(response.body)['duration']).to eq(180)
    end

    it 'returns the service price' do
      expect(JSON.parse(response.body)['price']).to eq(1)
    end

    it 'returns the service hidden_price' do
      expect(JSON.parse(response.body)['hidden_price']).to eq(1)
    end

    it 'returns the service availability' do
      expect(JSON.parse(response.body)['availability']).to eq('no')
    end

    it 'returns a status' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT requests', type: :request do
    it 'updates a service' do
      service = FactoryBot.create(:random_service)

      put "/api/v1/services/#{service.id}",
          params: { service:
                    { name: 'a_new_service' } }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['name']).to eq('a_new_service')
    end
  end

  describe 'DELETE requests', type: :request do
    it 'deletes a service' do
      service = FactoryBot.create(:random_service)

      delete "/api/v1/services/#{service.id}"

      expect(response).to have_http_status(:success)
    end
  end
end
