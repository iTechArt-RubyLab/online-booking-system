shared_examples 'response body' do |args|
  it "returns the service #{args[:field]}" do
    expect(JSON.parse(response.body)[args[:field]]).to eq(args[:value])
  end
end

shared_examples 'response success status' do
  it 'returns success status' do
    expect(response).to have_http_status(:success)
  end
end
