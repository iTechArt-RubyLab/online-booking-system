require 'rails_helper'
describe 'get all visits route', type: :request do
  let!(:visits) { FactoryBot.create_list(:random_visit, 20) }

  before { get '/api/v1/visits' }

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end

describe "post a visit route", :type => :request do
before do
    post '/api/v1/visits', params: { :start_at => '2022-01-18T00:00:00.000Z', :end_at => '2022-01-18T00:00:00.000Z', :price => 23, :adress => '763 Minsk', :status => 'created' }
  end
it 'returns the question' do
    expect(JSON.parse(response.body)['start_at']).to eq('2022-01-18T00:00:00.000Z')
  end
it 'returns the question\'s answer' do
    expect(JSON.parse(response.body)['end_at']).to eq('2022-01-18T00:00:00.000Z')
  end
it 'returns the question\'s service' do
    expect(JSON.parse(response.body)['price']).to eq(23)
  end
it 'returns the question\'s letter' do
    expect(JSON.parse(response.body)['adress']).to eq('763 Minsk')
  end
it 'returns the question\'s number' do
    expect(JSON.parse(response.body)['status']).to eq('created')
  end
it 'returns a created status' do
    expect(response).to have_http_status(:success)
  end
end
