require 'rails_helper'

describe 'Salons API POST', type: :request do
  describe 'POST requests', type: :request do
    before do
      post '/api/v1/salons',
           params: { salon:
                     { name: 'Beauty',
                       address: '9172 Jeneva Springsas',
                       phone: '+375 44 299-99-99',
                       email: 'hortencia@little-waelchia.org',
                       notes: 'Iusto soluta temporibus. Non deserunt rem.',
                       owner_id: 3 } }
    end

    include_examples 'response body', { field: 'name', value: 'Beauty' }
    include_examples 'response body', { field: 'address', value: '9172 Jeneva Springsas' }
    include_examples 'response body', { field: 'phone', value: '+375 44 299-99-99' }
    include_examples 'response body', { field: 'email', value: 'hortencia@little-waelchia.org' }
    include_examples 'response body', { field: 'notes', value: 'Iusto soluta temporibus. Non deserunt rem.' }
    include_examples 'response body', { field: 'owner_id', value: 3 }

    include_examples 'response success status'
  end
end
