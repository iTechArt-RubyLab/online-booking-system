require 'swagger_helper'

RSpec.describe 'api/v1/visits', type: :request do
  it 'returns all visits' do
    path '/api/v1/visits' do
      post 'Creates a visit' do
        tags 'Visits'
        consumes 'application/json'
        parameter name: :visit, in: :body, schema: {
          type: :object,
          properties: {
            user_id: { type: :integer },
            service_id: { type: :integer },
            date: { type: :string },
            time: { type: :string },
            duration: { type: :integer },
            price: { type: :integer },
            status: { type: :integer }
          },
          required: %w[user_id service_id date time duration price status]
        }

        response '201', 'visit created' do
          let(:visit) do
            { user_id: 'test', service_id: 'test', date: 'test', time: 'test', duration: 'test', price: 'test',
              status: 'test' }
          end
          run_test!
        end

        response '422', 'invalid request' do
          let(:visit) { { user_id: 'test' } }
          run_test!
        end
      end
    end

    get 'Retrieves a list of visits' do
      tags 'Visits'
      produces 'application/json'

      response '200', 'visits found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 user_id: { type: :integer },
                 service_id: { type: :integer },
                 date: { type: :string },
                 time: { type: :string },
                 duration: { type: :integer },
                 price: { type: :integer },
                 status: { type: :integer }
               },
               required: %w[id user_id service_id date time duration price status]

        let!(:visits) { create_list(:visit, 10) }
        run_test!
      end
    end

    get 'Retrieves a visit with sort and pagination' do
      tags 'Visits'
      produces 'application/json'

      response '200', 'visits found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 user_id: { type: :integer },
                 service_id: { type: :integer },
                 date: { type: :string },
                 time: { type: :string },
                 duration: { type: :integer },
                 price: { type: :integer },
                 status: { type: :integer }
               },
               required: %w[id user_id service_id date time duration price status]

        let!(:visits) { create_list(:visit, 10) }
        run_test!
      end

      response '422', 'invalid request' do
        let(:visit) { { user_id: 'test' } }
        run_test!
      end
    end
  end

  path '/api/v1/visits/{id}' do
    get 'Retrieves a visit' do
      tags 'Visits'
      produces 'application/json'

      response '200', 'visit found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 user_id: { type: :integer },
                 service_id: { type: :integer },
                 date: { type: :string },
                 time: { type: :string },
                 duration: { type: :integer },
                 price: { type: :integer },
                 status: { type: :integer }
               },
               required: %w[id user_id service_id date time duration price status]

        let(:visit) { create(:visit) }
        run_test!
      end

      response '422', 'invalid request' do
        let(:visit) { { user_id: 'test' } }
        run_test!
      end
    end

    patch 'Updates a visit' do
      tags 'Visits'
      consumes 'application/json'
      parameter name: :visit, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          service_id: { type: :integer },
          date: { type: :string },
          time: { type: :string },
          duration: { type: :integer },
          price: { type: :integer },
          status: { type: :integer }
        },
        required: %w[user_id service_id date time duration price status]
      }

      response '200', 'visit updated' do
        let(:visit) do
          { user_id: 'test', service_id: 'test', date: 'test', time: 'test', duration: 'test', price: 'test',
            status: 'test' }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:visit) { { user_id: 'test' } }
        run_test!
      end
    end

    delete 'Deletes a visit' do
      tags 'Visits'

      response '204', 'visit deleted' do
        let(:visit) { create(:visit) }
        run_test!
      end
    end
  end
end
