describe 'Salons API GET', type: :request do
  context 'when /salons' do
    before do
      create_list(:random_salon, 2)
      get '/api/v1/salons'
    end

    it 'have http status success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all salons' do
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  context 'when /salons/:id' do
    let!(:salon) { create(:random_salon) }

    before { get "/api/v1/salons/#{salon.id}" }

    include_examples 'success status'

    it 'return right salon' do
      expect(JSON.parse(response.body)['id']).to eq(salon.id)
    end
  end
end
