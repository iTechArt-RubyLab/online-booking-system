require 'swagger_helper'

RSpec.describe 'api/v1/categories', type: :request do
  path '/api/v1/categories' do
    post 'Creates a categorie' do
      tags 'Categories'
      consumes 'application/json'
      parameter name: :categorie, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          image_url: { type: :string }
        },
        required: %w[name image_url]
      }

      response '201', 'categorie created' do
        let(:categorie) { { name: 'test', image_url: 'test' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:categorie) { { name: 'test' } }
        run_test!
      end
    end
  end

  path 'api/v1/categories/{id}' do
    get 'Retrieves a categorie' do
      tags 'Categories'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'categorie found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 image_url: { type: :string }
               },
               required: %w[id name image_url]

        let(:id) { Category.create(name: 'test', image_url: 'test').id }
        run_test!
      end

      response '404', 'categorie not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates a categorie' do
      tags 'Categories'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :categorie, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          image_url: { type: :string }
        },
        required: %w[name image_url]
      }

      response '200', 'categorie updated' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 image_url: { type: :string }
               },
               required: %w[id name image_url]

        let(:id) { Category.create(name: 'test', image_url: 'test').id }
        let(:categorie) { { name: 'test', image_url: 'test' } }
        run_test!
      end

      response '404', 'categorie not found' do
        let(:id) { 'invalid' }
        let(:categorie) { { name: 'test', image_url: 'test' } }
        run_test!
      end
    end

    delete 'Deletes a categorie' do
      tags 'Categories'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '204', 'categorie deleted' do
        let(:id) { Category.create(name: 'test', image_url: 'test').id }
        run_test!
      end

      response '404', 'categorie not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
