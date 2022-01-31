require 'rails_helper'

describe 'delete visit route' do
  let(:visit_one) { create(:visit) }
  let(:visit_two) { create(:visit) }

  before do
    delete "/api/v1/visits/#{visit_one.id}"
  end

  include_examples 'success status'

  it 'deletes the visit' do
    id = JSON.parse(response.body)[:id]
    expect(Visit.find_by(id: id)).to be_nil
  end
end
