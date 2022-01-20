require 'rails_helper'
describe 'get all visits route', type: :request do
  let!(:visits) { FactoryBot.create_list(:random_visit, 20) }

  before { get '/api/v1/visits' }

  it 'returns all visits' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
