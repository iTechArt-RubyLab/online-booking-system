require 'rails_helper'

describe 'Visits API', type: :request do
  describe 'GET all visits route', type: :request do
    before { get '/api/v1/visits' }

    it 'returns status code 200' do
      create_list(:random_visit, 20)
      expect(response.status).to eq(200)
    end
  end

  describe 'POST a visit route', type: :request do
    before do
      post '/api/v1/visits',
           params: { visit: { start_at: '2022-01-18T00:00:00.000Z', end_at: '2022-01-18T00:00:00.000Z',
                              price: 23, adress: '763 Minsk', status: 'created' } }
    end

    it 'returns the visit start' do
      expect(JSON.parse(response.body)['start_at']).to eq('2022-01-18T00:00:00.000Z')
    end

    it 'returns the visit end' do
      expect(JSON.parse(response.body)['end_at']).to eq('2022-01-18T00:00:00.000Z')
    end

    it 'returns the visit price' do
      expect(JSON.parse(response.body)['price']).to eq(23)
    end

    it 'returns the visit adress' do
      expect(JSON.parse(response.body)['adress']).to eq('763 Minsk')
    end

    it 'returns the visit status' do
      expect(JSON.parse(response.body)['status']).to eq('created')
    end

    it 'returns a status' do
      expect(response.status).to eq(200)
    end
  end

  describe 'PUT /api/v1/visits/:id' do
    let(:visit) { create(:random_visit) }
    let(:new_adress) { Faker::Address.full_address }

    it 'updates a visit' do
      put "/api/v1/visits/#{visit.id}", params: { visit: { adress: new_adress } }
      expect(response.status).to eq(200)
      expect(Visit.find(visit.id).adress).to eq(new_adress)
    end
  end

  describe 'DELETE visit' do
    it 'delete visit' do
      visit = create(:random_visit)

      delete "/api/v1/visits/#{visit.id}"

      expect(response.status).to eq(200)

      get "/api/v1/visits/#{visit.id}"

      expect(response.status).to eq(404)
    end
  end
end
