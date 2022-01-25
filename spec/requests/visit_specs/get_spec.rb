require 'rails_helper'

describe 'Visits API GET', type: :request do
  context 'when /visits' do
    before do
      create_list(:random_visit, 2)
      get '/api/v1/visits'
    end

    include_examples 'success status'

    it 'returns all visits' do
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  context 'when /visits/:id' do
    let!(:visit) { create(:random_visit) }

    before { get "/api/v1/visits/#{visit.id}" }

    include_examples 'success status'

    it 'return right visit' do
      expect(JSON.parse(response.body)['id']).to eq(visit.id)
    end
  end
end
