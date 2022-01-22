require 'rails_helper'

describe 'User', type: :request do
  describe 'GET all users route', type: :request do
    before { get '/api/v1/users' }

    it 'returns status code 200' do
      create_list(:random_user, 20)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET a user route', type: :request do
    before { get '/api/v1/users/1' }

    let(:user) { create(:random_user) }

    it 'returns the user' do
      expect(JSON.parse(response.user.body)['first_name']).to eq(user.first_name)
    end

    it 'returns a status' do
      expect(response.status).to eq(200)
    end
  end

  describe 'POST a user route', type: :request do
    before do
      post '/api/v1/users',
           params: { first_name: 'John', last_name: 'Smith', patronymic: 'Johnovich',
                     salon_id: 10, email: 'gek@mail.ru', work_email: 'gek@outlook.com', phone: '+375 25 609-99-99',
                     work_phone: '+375 33 200-11-11', birthday: '1998-01-20', role: 1, status: 1, notes: 'test' }
    end

    it 'returns the user first_name' do
      expect(JSON.parse(response.body)['first_name']).to eq('John')
    end

    it 'returns the user last_name' do
      expect(JSON.parse(response.body)['last_name']).to eq('Smith')
    end

    it 'returns the user patronymic' do
      expect(JSON.parse(response.body)['patronymic']).to eq('Johnovich')
    end

    it 'returns the user salon_id' do
      expect(JSON.parse(response.body)['salon_id']).to eq(10)
    end

    it 'returns the user email' do
      expect(JSON.parse(response.body)['email']).to eq('gek@mail.ru')
    end

    it 'returns the user work_email' do
      expect(JSON.parse(response.body)['work_email']).to eq('gek@outlook.com')
    end

    it 'returns the user phone' do
      expect(JSON.parse(response.body)['phone']).to eq('+375 25 609-99-99')
    end

    it 'returns the user birthday' do
      expect(JSON.parse(response.body)['birthday']).to eq('1998-01-20')
    end

    it 'returns the user role' do
      expect(JSON.parse(response.body)['role']).to eq(1)
    end

    it 'returns the user status' do
      expect(JSON.parse(response.body)['status']).to eq(1)
    end

    it 'returns the user notes' do
      expect(JSON.parse(response.body)['notes']).to eq('test')
    end

    it 'return a status' do
      expect(response.status).to eq(200)
    end
  end

  describe 'PUT /api/v1/users/:id' do
    let(:user) { create(:random_user) }
    let(:new_first_name) { Faker::Name.first_name }

    it 'updates a user' do
      put "/api/v1/users/#{user.id}", params: { first_name: new_first_name }
      expect(response.status).to eq(200)
      expect(User.find(user.id).first_name).to eq(new_first_name)
    end
  end

  describe 'DELETE /api/v1/users/:id' do
    let!(:user) { create(:random_user) }

    it 'delete a user' do
      expect { delete "/api/v1/users/#{user.id}" }.to change(User, :count).by(-1)
    end
  end
end
