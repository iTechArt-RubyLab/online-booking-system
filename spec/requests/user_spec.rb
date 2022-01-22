require 'rails_helper'

describe 'Users API', type: :request do
  describe 'GET requests' do
    it 'returns all users' do
      create(:random_user)
      create(:random_user)

      get '/api/v1/users'

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it 'return one user' do
      user = create(:random_user)

      get "/api/v1/users/#{user.id}"

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['first_name']).to eq(user.first_name)
    end
  end

  describe 'POST request' do
    before do
      post '/api/v1/users',
           params: { user: { first_name: 'John', last_name: 'Smith', patronymic: 'Johnovich',
                             salon_id: 10, email: 'gek@mail.ru', work_email: 'gek@outlook.com',
                             phone: '+375 25 609-99-99', work_phone: '+375 33 200-11-11',
                             birthday: '1998-01-20T00:00:00.000Z', role: 'professional',
                             status: 'working', notes: 'test',
                             image_url: 'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&f=y' } }
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
      expect(JSON.parse(response.body)['birthday']).to eq('1998-01-20T00:00:00.000Z')
    end

    it 'returns the user role' do
      expect(JSON.parse(response.body)['role']).to eq('professional')
    end

    it 'returns the user status' do
      expect(JSON.parse(response.body)['status']).to eq('working')
    end

    it 'returns the user notes' do
      expect(JSON.parse(response.body)['notes']).to eq('test')
    end

    it 'returns the user image_url' do
      expect(JSON.parse(response.body)['image_url']).to eq('https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&f=y')
    end

    it 'return a status' do
      expect(response.status).to eq(200)
    end
  end

  describe 'PUT request' do
    it 'updates the user' do
      user = create(:random_user)

      put "/api/v1/users/#{user.id}",
          params: { user: { first_name: 'Ginger', last_name: 'Smithy', patronymic: 'Jackson', salon_id: 10 } }

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['first_name']).to eq('Ginger')
    end
  end

  describe 'DELETE request' do
    it 'deletes the user' do
      user = create(:random_user)

      delete "/api/v1/users/#{user.id}"

      expect(response.status).to eq(200)

      get "/api/v1/users/#{user.id}"

      expect(response.status).to eq(404)
    end
  end
end
