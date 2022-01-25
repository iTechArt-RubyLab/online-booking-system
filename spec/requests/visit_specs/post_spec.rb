require 'rails_helper'

describe 'post a visit route', type: :request do
  before do
    post '/api/v1/visits',
         params: {
           start_at: '2022-01-18T00:00:00.000Z',
           end_at: '2022-01-18T00:00:00.000Z', price: 23, adress: '763 Minsk',
           status: 'created'
         }
  end

  include_examples 'response body', { field: 'start_at', value: '2022-01-18T00:00:00.000Z' }
  include_examples 'response body', { field: 'end_at', value: '2022-01-18T00:00:00.000Z' }
  include_examples 'response body', { field: 'price', value: 23 }
  include_examples 'response body', { field: 'adress', value: '763 Minsk' }
  include_examples 'response body', { field: 'status', value: 'created' }

  include_examples 'response success status'
end
