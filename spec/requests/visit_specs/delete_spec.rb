require 'rails_helper'

describe 'delete visit route' do
  let(:visit_one) { create(:random_visit) }
  let(:visit_two) { create(:random_visit) }

  before do
    delete "/api/v1/visits/#{visit_one.id}"
  end

  include_examples 'success status'

  it 'deletes the visit' do
    id = JSON.parse(response.body)[:id]
    expect(Visit.find_by(id: id)).to be_nil
  end
end
