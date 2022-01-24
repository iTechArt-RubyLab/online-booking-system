require 'rails_helper'

describe 'Users API PUT', type: :request do
  describe 'PUT requests', type: :request do
    context 'when /users/:id' do
      let(:user) { create(:random_user) }

      before do
        put "/api/v1/users/#{user.id}",
            params: { user: { first_name: 'Ginger', last_name: 'Smithy', patronymic: 'Jackson', salon_id: 10 } }
      end

      it 'have http status success' do
        expect(response).to have_http_status(:success)
      end

      it 'updates a service' do
        expect(JSON.parse(response.body)['first_name']).to eq('Ginger')
      end
    end
  end
end
