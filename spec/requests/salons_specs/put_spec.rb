require 'rails_helper'

describe 'Salons API PUT', type: :request do
  let(:salon) { create(:salon) }
  let(:new_adress) { Faker::Address.full_address }
  let(:salon_owner) { create(:salon_owner) }
  let(:salon_owner_auth_headers) { salon_owner.create_new_auth_token }

  describe 'PUT /api/v1/salons/:id' do
    context 'when the request is valid' do
      before do
        put "/api/v1/salons/#{salon.id}", params: { salon: { address: new_adress } }, headers: salon_owner_auth_headers
      end

      include_examples 'success status'

      it 'updates a service' do
        expect(Salon.find(salon.id).address).to eq(new_adress)
      end
    end

    context 'when the request is invalid' do
      before do
        put "/api/v1/salons/#{salon.id}", params: { salon: { address: nil } }, headers: salon_owner_auth_headers
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/can't be blank/)
      end
    end
  end
end
