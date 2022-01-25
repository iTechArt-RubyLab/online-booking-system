require 'rails_helper'

describe 'get all visits route', type: :request do
  before { get '/api/v1/visits' }

  include_examples 'response success status'
end
