require 'rails_helper'

describe 'Services API PUT', type: :request do
  describe 'PUT requests', type: :request do
    context 'when /servicis/:id' do
      let(:service) { create(:random_service) }

      before do
        put "/api/v1/services/#{service.id}",
            params: {
              service: { name: 'a_new_service' }
            }
      end

      it 'have http status success' do
        expect(response).to have_http_status(:success)
      end

      it 'updates a service' do
        expect(JSON.parse(response.body)['name']).to eq('a_new_service')
      end
    end
  end
end
