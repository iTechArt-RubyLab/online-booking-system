require 'spec_helper'
RSpec.describe Api::V1::VisitsController, :type => :controller do
  describe "GET #index" do
    before do
      get :index
    end
    it "JSON body response contains expected attributes" do
      json_response = JSON.parse(response.body)
      expect(hash_body.keys).to match_array([:start_at, :end_at, :price, :adress, :status])
    end
  end
end
