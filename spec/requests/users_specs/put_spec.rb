require 'rails_helper'

describe 'Users API PUT', type: :request do
  describe 'PUT requests', type: :request do
    context 'when /users/:id' do
      let(:user) { create(:user) }

      before do
        put "/api/v1/users/#{user.id}",
            params: { user: { first_name: 'Ginger', last_name: 'Smithy', middle_name: 'Jackson', salon_id: 10 } }
      end

      include_examples 'success status'

      it 'updates a service' do
        expect(JSON.parse(response.body)['first_name']).to eq('Ginger')
      end
    end
  end
end
