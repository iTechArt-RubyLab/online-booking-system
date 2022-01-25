require 'spec_helper'
RSpec.describe Api::V1::VisitsController, type: :controller do
  describe 'GET #index' do
    before do
      get :index
    end

    it 'JSON body response contains expected attributes' do
      expect(hash_body.keys).to match_array(%i[start_at end_at price adress status])
    end
  end
end
