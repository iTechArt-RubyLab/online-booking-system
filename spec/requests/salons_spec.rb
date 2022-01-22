require 'rails_helper'

describe 'Salons API', type: :request do
  describe 'GET requests' do
    it 'returns all salons' do
      create(:random_salon)
      create(:random_salon)

      get '/api/v1/salons'

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it 'return one salon' do
      salon = create(:random_salon)

      get "/api/v1/salons/#{salon.id}"

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['name']).to eq(salon.name)
    end
  end

  describe 'POST request' do
    before do
      post '/api/v1/salons',
           params: { salon:
                     { name: 'Beauty',
                       address: '9172 Jeneva Springsas',
                       phone: '+375 44 299-99-99',
                       email: 'hortencia@little-waelchia.org',
                       notes: 'Iusto soluta temporibus. Non deserunt rem.',
                       owner_id: 3 } }
    end

    it 'returns the salon name' do
      expect(JSON.parse(response.body)['name']).to eq('Beauty')
    end

    it 'returns the salon address' do
      expect(JSON.parse(response.body)['address']).to eq('9172 Jeneva Springsas')
    end

    it 'returns the salon phone' do
      expect(JSON.parse(response.body)['phone']).to eq('+375 44 299-99-99')
    end

    it 'returns the salon email' do
      expect(JSON.parse(response.body)['email']).to eq('hortencia@little-waelchia.org')
    end

    it 'returns the salon notes' do
      expect(JSON.parse(response.body)['notes']).to eq('Iusto soluta temporibus. Non deserunt rem.')
    end

    it 'returns the salon owner_id' do
      expect(JSON.parse(response.body)['owner_id']).to eq(3)
    end
  end

  describe 'PUT request' do
    let(:salon) { create(:random_salon) }
    let(:new_adress) { Faker::Address.full_address }

    it 'updates a salon' do
      put "/api/v1/salons/#{salon.id}", params: { salon: { address: new_adress } }
      expect(response.status).to eq(200)
      expect(Salon.find(salon.id).address).to eq(new_adress)
    end
  end

  describe 'DELETE request', type: :request do
    it 'deletes a salon' do
      salon = create(:random_salon)

      delete "/api/v1/salons/#{salon.id}"

      expect(response.status).to eq(200)

      get "/api/v1/salons/#{salon.id}"

      expect(response.status).to eq(404)
    end
  end
end
