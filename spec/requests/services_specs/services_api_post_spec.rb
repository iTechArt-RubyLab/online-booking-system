require 'rails_helper'

describe 'Services API POST', type: :request do
  describe 'POST requests', type: :request do
    before do
      post '/api/v1/services',
           params: {
             service: {
               category: 1,
               salon_id: 1,
               name: 'a_service',
               description: 'a_description',
               duration: 180,
               price: 1,
               hidden_price: 1,
               availability: 'no'
             }
           }
    end

    include_examples 'response body', { field: 'name', value: 'a_service' }
    include_examples 'response body', { field: 'description', value: 'a_description' }
    include_examples 'response body', { field: 'duration', value: 180 }
    include_examples 'response body', { field: 'price', value: 1 }
    include_examples 'response body', { field: 'hidden_price', value: 1 }
    include_examples 'response body', { field: 'availability', value: 'no' }

    include_examples 'success status'
  end
end
