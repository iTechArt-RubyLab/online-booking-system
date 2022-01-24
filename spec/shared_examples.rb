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

shared_examples 'to be invalid' do |factory_trait|
  subject { build(:"random_#{described_class.name.underscore}", factory_trait) }

  it { is_expected.to be_invalid }
end

shared_examples 'to be valid' do |factory_trait|
  subject { build(:"random_#{described_class.name.underscore}", factory_trait) }

  it { is_expected.to be_valid }
end
