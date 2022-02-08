require 'swagger_helper'

RSpec.describe 'api/v1/clients', type: :request do
  it 'returns all clients' do
    path '/api/v1/clients' do
      post 'Creates a client' do
        tags 'Clients'
        consumes 'application/json'
        parameter name: :client, in: :body, schema: {
          type: :object,
          properties: {
            first_name: { type: :string },
            last_name: { type: :string },
            middle_name: { type: :string },
            email: { type: :string },
            phone: { type: :string },
            birthday: { type: :datetime },
            notes: { type: :text },
            image_url: { type: :string },
            rating: { type: :integer }
          },
          required: %w[first_name last_name middle_name email phone birthday image_url rating]
        }

        response '201', 'client created' do
          let(:client) do
            { first_name: 'test', last_name: 'test', middle_name: 'test', email: 'test',
              phone: 'test', birthday: 'test', notes: 'test', image_url: 'test', rating: 'test' }
          end
          run_test!
        end

        response '422', 'invalid request' do
          let(:client) { { first_name: 'test' } }
          run_test!
        end
      end
    end

    get 'Retrieves a list of clients' do
      tags 'Clients'
      produces 'application/json'

      response '200', 'clients found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 first_name: { type: :string },
                 last_name: { type: :string },
                 middle_name: { type: :string },
                 email: { type: :string },
                 phone: { type: :string },
                 birthday: { type: :datetime },
                 notes: { type: :text },
                 image_url: { type: :string },
                 rating: { type: :integer }
               },
               required: %w[id first_name last_name middle_name email phone birthday image_url rating]

        let(:clients) { create_list(:client, 10) }
        run_test!
      end
    end

    get 'Retrieves a client with sorted list' do
      tags 'Clients'
      produces 'application/json'
      parameter name: :sort, in: :query, schema: { type: :string }

      response '200', 'clients found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 first_name: { type: :string },
                 last_name: { type: :string },
                 middle_name: { type: :string },
                 email: { type: :string },
                 phone: { type: :string },
                 birthday: { type: :datetime },
                 notes: { type: :text },
                 image_url: { type: :string },
                 rating: { type: :integer }
               },
               required: %w[id first_name last_name middle_name email phone birthday image_url rating]

        let(:clients) { create_list(:client, 10) }
        run_test!
      end
    end
  end

  path 'api/v1/clients/{id}' do
    get 'Retrieves a client' do
      tags 'Clients'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'client found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 first_name: { type: :string },
                 last_name: { type: :string },
                 middle_name: { type: :string },
                 email: { type: :string },
                 phone: { type: :string },
                 birthday: { type: :datetime },
                 notes: { type: :text },
                 image_url: { type: :string },
                 rating: { type: :integer }
               },
               required: %w[id first_name last_name middle_name email phone birthday image_url rating]

        let(:id) do
          Client.create(first_name: 'test', last_name: 'test', middle_name: 'test', email: 'test', phone: 'test',
                        birthday: 'test', notes: 'test', image_url: 'test', rating: 'test').id
        end
        run_test!
      end

      response '404', 'client not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates a client' do
      tags 'Clients'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :client, in: :body, schema: {
        type: :object,
        properties: {
          first_name: { type: :string },
          last_name: { type: :string },
          middle_name: { type: :string },
          email: { type: :string },
          phone: { type: :string },
          birthday: { type: :datetime },
          notes: { type: :text },
          image_url: { type: :string },
          rating: { type: :integer }
        },
        required: %w[first_name last_name middle_name email phone birthday image_url rating]
      }

      response '200', 'client updated' do
        let(:id) do
          Client.create(first_name: 'test', last_name: 'test', middle_name: 'test', email: 'test', phone: 'test',
                        birthday: 'test', notes: 'test', image_url: 'test', rating: 'test').id
        end
        let(:client) do
          { first_name: 'test', last_name: 'test', middle_name: 'test', email: 'test', phone: 'test', birthday: 'test',
            notes: 'test', image_url: 'test', rating: 'test' }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) do
          Client.create(first_name: 'test', last_name: 'test', middle_name: 'test', email: 'test', phone: 'test',
                        birthday: 'test', notes: 'test', image_url: 'test', rating: 'test').id
        end
        let(:client) { { first_name: 'test' } }
        run_test!
      end
    end

    delete 'Deletes a client' do
      tags 'Clients'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '204', 'client deleted' do
        let(:id) do
          Client.create(first_name: 'test', last_name: 'test', middle_name: 'test', email: 'test', phone: 'test',
                        birthday: 'test', notes: 'test', image_url: 'test', rating: 'test').id
        end
        run_test!
      end

      response '404', 'client not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
