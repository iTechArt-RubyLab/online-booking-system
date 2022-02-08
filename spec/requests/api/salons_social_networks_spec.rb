require 'swagger_helper'

RSpec.describe 'api/v1/salons_social_networks', type: :request do
  it 'returns all salons_social_networks' do
    path '/api/v1/salons_social_networks' do
      post 'Creates a salon_social_network' do
        tags 'Salons Social Networks'
        consumes 'application/json'
        parameter name: :salon_social_network, in: :body, schema: {
          type: :object,
          properties: {
            salon_id: { type: :integer },
            social_network_id: { type: :integer },
            link: { type: :string }
          },
          required: %w[salon_id social_network_id link]
        }

        response '201', 'salon_social_network created' do
          let(:salon_social_network) do
            { salon_id: 'test', social_network_id: 'test', link: 'test' }
          end
          run_test!
        end

        response '422', 'invalid request' do
          let(:salon_social_network) { { salon_id: 'test' } }
          run_test!
        end
      end

      get 'Retrieves a list of salon_social_networks' do
        tags 'Salons Social Networks'
        produces 'application/json'

        response '200', 'salon_social_networks found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   salon_id: { type: :integer },
                   social_network_id: { type: :integer },
                   link: { type: :string }
                 },
                 required: %w[id salon_id social_network_id link]

          let(:salon_social_networks) { create_list(:salon_social_network, 10) }
          run_test!
        end
      end
    end

    get 'Retrieves a salon_social_network with sort and pagination' do
      tags 'Salons Social Networks'
      produces 'application/json'
      parameter name: :sort, in: :query, type: :string, enum: %w[id salon_id social_network_id link]
      parameter name: :page, in: :query, type: :integer
      parameter name: :per_page, in: :query, type: :integer

      response '200', 'salon_social_network found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 salon_id: { type: :integer },
                 social_network_id: { type: :integer },
                 link: { type: :string }
               },
               required: %w[id salon_id social_network_id link]

        let(:salon_social_networks) { create_list(:salon_social_network, 10) }
        run_test!
      end
    end
  end

  path '/api/v1/salons_social_networks/{id}' do
    put 'Updates a salon_social_network' do
      tags 'Salons Social Networks'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :salon_social_network, in: :body, schema: {
        type: :object,
        properties: {
          salon_id: { type: :integer },
          social_network_id: { type: :integer },
          link: { type: :string }
        },
        required: %w[salon_id social_network_id link]
      }

      response '200', 'salon_social_network updated' do
        let(:id) { create(:salon_social_network).id }
        let(:salon_social_network) do
          { salon_id: 'test', social_network_id: 'test', link: 'test' }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { create(:salon_social_network).id }
        let(:salon_social_network) { { salon_id: 'test' } }
        run_test!
      end
    end

    delete 'Deletes a salon_social_network' do
      tags 'Salons Social Networks'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '204', 'salon_social_network deleted' do
        let(:id) { create(:salon_social_network).id }
        run_test!
      end
    end
  end
end
