require 'rails_helper'

describe 'Services API DELETE', type: :request do
  let(:service) { create(:service) }
  let(:salon_owner) { create(:salon_owner) }
  let(:salon_owner_auth_headers) { salon_owner.create_new_auth_token }

  describe 'DELETE /api/v1/services/:id' do
    context 'when the request is valid' do
      before { delete "/api/v1/services/#{service.id}", headers: salon_owner_auth_headers }

      include_examples 'success status'

      it 'deletes the service' do
        expect { Service.find(service.id) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
