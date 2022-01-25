require 'rails_helper'

describe 'Services API PUT', type: :request do
  describe 'PUT requests', type: :request do
    context 'when /services/:id' do
      let(:service) { create(:random_service) }

      before do
        put "/api/v1/services/#{service.id}",
            params: {
              service: { name: 'a_new_service' }
            }
      end

      include_examples 'success status'

      it 'updates a service' do
        expect(JSON.parse(response.body)['name']).to eq('a_new_service')
      end
    end
  end
end
