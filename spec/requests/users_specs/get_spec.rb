describe 'Users API GET', type: :request do
  context 'when /users' do
    before do
      create_list(:random_user, 2)
      get '/api/v1/users'
    end

    it 'have http status success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all users' do
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  context 'when /users/:id' do
    let!(:user) { create(:random_user) }

    before { get "/api/v1/users/#{user.id}" }

    include_examples 'success status'

    it 'return right user' do
      expect(JSON.parse(response.body)['id']).to eq(user.id)
    end
  end
end
