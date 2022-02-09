require 'rails_helper'

describe 'Salons API DELETE', type: :request do
  let(:salon) { create(:salon) }
  let(:salon_owner) { create(:salon_owner) }
  let(:salon_owner_auth_headers) { salon_owner.create_new_auth_token }

  describe 'DELETE /api/v1/salons/:id' do
    context 'when the request is valid' do
      before { delete "/api/v1/salons/#{salon.id}", headers: salon_owner_auth_headers }

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'deletes the salon' do
        expect { Salon.find(salon.id) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
