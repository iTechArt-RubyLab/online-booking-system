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
it 'returns the visit start' do
    expect(JSON.parse(response.body)['start_at']).to eq('2022-01-18T00:00:00.000Z')
  end
it 'returns the visit end' do
    expect(JSON.parse(response.body)['end_at']).to eq('2022-01-18T00:00:00.000Z')
  end
it 'returns the visit price' do
    expect(JSON.parse(response.body)['price']).to eq(23)
  end
it 'returns the visit adress' do
    expect(JSON.parse(response.body)['adress']).to eq('763 Minsk')
  end
it 'returns the visit status' do
    expect(JSON.parse(response.body)['status']).to eq('created')
  end
it 'returns a created status' do
    expect(response).to have_http_status(:success)
  end
end


describe "PUT /api/v1/visits/:id" do
  before(:each) do
      @visit = FactoryBot.create(:random_visit)
    end
  it 'updates a visit' do
  @new_adress = Faker::Address.full_address
  put "/api/v1/visits/#{@visit.id}",params: {adress: @new_adress}
  expect(response.status).to eq(200)
  expect(Visit.find(@visit.id).adress).to eq(@new_adress)
end
end


describe "delete visit route" do
  before(:each) do
      @visit_one = FactoryBot.create(:random_visit)
      @visit_two = FactoryBot.create(:random_visit)
  end
it 'should delete the visit' do
get "/api/v1/visits"
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)).to eq([YAML.load(@visit_one.to_json),YAML.load(@visit_two.to_json),])
delete "/api/v1/visits/#{@visit_one.id}"
    expect(response.status).to eq(200)
get "/api/v1/visits"
    expect(JSON.parse(response.body)).to eq([YAML.load(@visit_two.to_json)])
  end
end
