require 'rails_helper'

describe 'Users API POST', type: :request do
  describe 'POST requests', type: :request do
    before do
      post '/api/v1/users',
           params: { user: { first_name: 'John', last_name: 'Smith', patronymic: 'Johnovich',
                             salon_id: 10, email: 'gek@mail.ru', work_email: 'gek@outlook.com',
                             phone: '+375 25 609-99-99', work_phone: '+375 33 200-11-11',
                             birthday: '1998-01-20T00:00:00.000Z', role: 'professional',
                             status: 'working', notes: 'test',
                             image_url: 'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&f=y' } }
    end

    include_examples 'response body', { field: 'first_name', value: 'John' }
    include_examples 'response body', { field: 'last_name', value: 'Smith' }
    include_examples 'response body', { field: 'patronymic', value: 'Johnovich' }
    include_examples 'response body', { field: 'salon_id', value: 10 }
    include_examples 'response body', { field: 'email', value: 'gek@mail.ru' }
    include_examples 'response body', { field: 'work_email', value: 'gek@outlook.com' }
    include_examples 'response body', { field: 'phone', value: '+375 25 609-99-99' }
    include_examples 'response body', { field: 'work_phone', value: '+375 33 200-11-11' }
    include_examples 'response body', { field: 'birthday', value: '1998-01-20T00:00:00.000Z' }
    include_examples 'response body', { field: 'role', value: 'professional' }
    include_examples 'response body', { field: 'status', value: 'working' }
    include_examples 'response body', { field: 'notes', value: 'test' }
    include_examples 'response body',
                     { field: 'image_url',
                       value: 'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&f=y' }

    include_examples 'response success status'
  end
end
