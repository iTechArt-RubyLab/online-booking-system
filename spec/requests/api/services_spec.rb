require 'swagger_helper'

RSpec.describe 'api/v1/services', type: :request do
  path '/api/v1/services' do
    post 'Creates a service' do
      tags 'Services'
      consumes 'application/json'
      parameter name: :service, in: :body, schema: {
        type: :object,
        properties: {
          salon_id: { type: :integer },
          name: { type: :string },
          description: { type: :text },
          duration: { type: :integer },
          price: { type: :integer },
          availability: { type: :integer },
          category_id: { type: :integer }
        },
        required: %w[salon_id name description duration price availability category_id]
      }

      response '201', 'service created' do
        let(:service) do
          { salon_id: 'test', name: 'test', description: 'test', duration: 'test', price: 'test', availability: 'test',
            category_id: 'test' }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:service) { { salon_id: 'test' } }
        run_test!
      end
    end

    get 'Retrieves a list of services' do
      tags 'Services'
      produces 'application/json'

      response '200', 'services found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 salon_id: { type: :integer },
                 name: { type: :string },
                 description: { type: :text },
                 duration: { type: :integer },
                 price: { type: :integer },
                 availability: { type: :integer },
                 category_id: { type: :integer }
               },
               required: %w[id salon_id name description duration price availability category_id]

        let!(:services) { create_list(:service, 10) }
        run_test!
      end
    end

    get 'Retrieves a service with sort and pagination' do
      tags 'Services'
      produces 'application/json'
      parameter name: :sort, in: :query, type: :string,
                enum: %w[id salon_id name description duration price availability category_id]
      parameter name: :page, in: :query, type: :integer
      parameter name: :per_page, in: :query, type: :integer

      response '200', 'service found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 salon_id: { type: :integer },
                 name: { type: :string },
                 description: { type: :text },
                 duration: { type: :integer },
                 price: { type: :integer },
                 availability: { type: :integer },
                 category_id: { type: :integer }
               },
               required: %w[id salon_id name description duration price availability category_id]

        let!(:services) { create_list(:service, 10) }
        run_test!
      end

      response '422', 'invalid request' do
        let(:services) { { salon_id: 'test' } }
        run_test!
      end
    end
  end

  path '/api/v1/services/{id}' do
    get 'Retrieves a service' do
      tags 'Services'
      produces 'application/json'

      parameter name: :id, in: :path, type: :integer

      response '200', 'service found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 salon_id: { type: :integer },
                 name: { type: :string },
                 description: { type: :text },
                 duration: { type: :integer },
                 price: { type: :integer },
                 availability: { type: :integer },
                 category_id: { type: :integer }
               },
               required: %w[id salon_id name description duration price availability category_id]

        let!(:service) { create(:service) }
        run_test!
      end

      response '404', 'service not found' do
        let(:id) { 0 }
        run_test!
      end
    end

    patch 'Updates a service' do
      tags 'Services'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :service, in: :body, schema: {
        type: :object,
        properties: {
          salon_id: { type: :integer },
          name: { type: :string },
          description: { type: :text },
          duration: { type: :integer },
          price: { type: :integer },
          availability: { type: :integer },
          category_id: { type: :integer }
        },
        required: %w[salon_id name description duration price availability category_id]
      }

      response '200', 'service updated' do
        let(:service) do
          { salon_id: 'test', name: 'test', description: 'test', duration: 'test', price: 'test', availability: 'test',
            category_id: 'test' }
        end
        run_test!
      end

      response '404', 'service not found' do
        let(:id) { 0 }
        run_test!
      end

      response '422', 'invalid request' do
        let(:service) { { salon_id: 'test' } }
        run_test!
      end
    end

    delete 'Deletes a service' do
      tags 'Services'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'service deleted' do
        let!(:service) { create(:service) }
        run_test!
      end

      response '404', 'service not found' do
        let(:id) { 0 }
        run_test!
      end
    end
  end
end
