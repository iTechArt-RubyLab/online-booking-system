require 'swagger_helper'

RSpec.describe 'api/v1/salons', type: :request do
  it 'returns all salons' do
    path '/api/v1/salons' do
      post 'Creates a salon' do
        tags 'Salons'
        consumes 'application/json'
        parameter name: :salon, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            address: { type: :string },
            phone: { type: :string },
            email: { type: :string },
            notes: { type: :string },
            latitude: { type: :float },
            longitude: { type: :float }
          },
          required: %w[name address phone email notes latitude longitude]
        }

        response '201', 'salon created' do
          let(:salon) do
            { name: 'test', address: 'test', phone: 'test', email: 'test', notes: 'test', latitude: 'test',
              longitude: 'test' }
          end
          run_test!
        end

        response '422', 'invalid request' do
          let(:salon) { { name: 'test' } }
          run_test!
        end
      end
    end

    get 'Retrieves a list of salons' do
      tags 'Salons'
      produces 'application/json'

      response '200', 'salons found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 address: { type: :string },
                 phone: { type: :string },
                 email: { type: :string },
                 notes: { type: :string },
                 latitude: { type: :float },
                 longitude: { type: :float }
               },
               required: %w[id name address phone email notes latitude longitude]

        let(:salons) { create_list(:salon, 10) }
        run_test!
      end
    end

    get 'Retrieves a salon with sort and pagination' do
      tags 'Salons'
      produces 'application/json'
      parameter name: :sort, in: :query, type: :string, enum: %w[name address phone email notes latitude longitude]
      parameter name: :page, in: :query, type: :integer
      parameter name: :per_page, in: :query, type: :integer

      response '200', 'salons found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 address: { type: :string },
                 phone: { type: :string },
                 email: { type: :string },
                 notes: { type: :string },
                 latitude: { type: :float },
                 longitude: { type: :float }
               },
               required: %w[id name address phone email notes latitude longitude]

        let(:salons) { create_list(:salon, 10) }
        run_test!
      end
    end
  end

  path '/api/v1/salons/{id}' do
    get 'Retrieves a salon' do
      tags 'Salons'
      produces 'application/json'

      response '200', 'salon found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 address: { type: :string },
                 phone: { type: :string },
                 email: { type: :string },
                 notes: { type: :string },
                 latitude: { type: :float },
                 longitude: { type: :float }
               },
               required: %w[id name address phone email notes latitude longitude]

        let(:salon) { create(:salon) }
        run_test!
      end
    end

    patch 'Updates a salon' do
      tags 'Salons'
      consumes 'application/json'
      parameter name: :salon, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          address: { type: :string },
          phone: { type: :string },
          email: { type: :string },
          notes: { type: :string },
          latitude: { type: :float },
          longitude: { type: :float }
        },
        required: %w[name address phone email notes latitude longitude]
      }

      response '200', 'salon updated' do
        let(:salon) do
          { name: 'test', address: 'test', phone: 'test', email: 'test', notes: 'test', latitude: 'test',
            longitude: 'test' }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:salon) { { name: 'test' } }
        run_test!
      end
    end

    delete 'Deletes a salon' do
      tags 'Salons'

      response '204', 'salon deleted' do
        let(:salon) { create(:salon) }
        run_test!
      end
    end
  end
end
