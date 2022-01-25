require 'rails_helper'

describe 'Salons API PUT', type: :request do
  describe 'PUT requests', type: :request do
    context 'when /salons/:id' do
      let(:salon) { create(:random_salon) }
      let(:new_adress) { Faker::Address.full_address }

      before do
        put "/api/v1/salons/#{salon.id}", params: { salon: { address: new_adress } }
      end

      include_examples 'success status'

      it 'updates a service' do
        expect(Salon.find(salon.id).address).to eq(new_adress)
      end
    end
  end
end
