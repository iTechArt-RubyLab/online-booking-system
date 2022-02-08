require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
  path '/api/v1/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          first_name: { type: :string },
          last_name: { type: :string },
          middle_name: { type: :string },
          email: { type: :string },
          phone: { type: :string },
          birthday: { type: :string },
          role: { type: :string },
          status: { type: :string },
          work_email: { type: :string },
          work_phone: { type: :string },
          rating: { type: :integer },
          notes: { type: :text }
        },
        required: %w[first_name last_name middle_name email phone birthday role status work_email work_phone rating
                     notes]
      }

      response '201', 'user created' do
        let(:user) do
          { first_name: 'test', last_name: 'test', middle_name: 'test', email: 'test', phone: 'test', birthday: 'test', role: 'test', status: 'test',
            work_email: 'test', work_phone: 'test', rating: 'test', notes: 'test' }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { first_name: 'test' } }
        run_test!
      end
    end

    get 'Retrieves a list of users' do
      tags 'Users'
      produces 'application/json'

      response '200', 'users found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 first_name: { type: :string },
                 last_name: { type: :string },
                 middle_name: { type: :string },
                 email: { type: :string },
                 phone: { type: :string },
                 birthday: { type: :string },
                 role: { type: :string },
                 status: { type: :string },
                 work_email: { type: :string },
                 work_phone: { type: :string },
                 rating: { type: :integer },
                 notes: { type: :text }
               },
               required: %w[id first_name last_name middle_name email phone birthday role status work_email work_phone
                            rating notes]

        let!(:users) { create_list(:user, 10) }
        run_test!
      end
    end

    get 'Retrieves a user with sort and pagination' do
      tags 'Users'
      produces 'application/json'
      parameter name: :sort, in: :query, type: :string,
                enum: %w[id first_name last_name middle_name email phone birthday role status work_email work_phone rating notes]
      parameter name: :page, in: :query, type: :integer
      parameter name: :per_page, in: :query, type: :integer

      response '200', 'professional found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 first_name: { type: :string },
                 last_name: { type: :string },
                 middle_name: { type: :string },
                 email: { type: :string },
                 phone: { type: :string },
                 birthday: { type: :string },
                 role: { type: :string },
                 status: { type: :string },
                 work_email: { type: :string },
                 work_phone: { type: :string },
                 rating: { type: :integer },
                 notes: { type: :text }
               },
               required: %w[id first_name last_name middle_name email phone birthday role status work_email work_phone
                            rating notes]

        let!(:users) { create_list(:user, 10) }
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    get 'Retrieves a user' do
      tags 'Users'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'user found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 first_name: { type: :string },
                 last_name: { type: :string },
                 middle_name: { type: :string },
                 email: { type: :string },
                 phone: { type: :string },
                 birthday: { type: :string },
                 role: { type: :string },
                 status: { type: :string },
                 work_email: { type: :string },
                 work_phone: { type: :string },
                 rating: { type: :integer },
                 notes: { type: :text }
               },
               required: %w[id first_name last_name middle_name email phone birthday role status work_email work_phone
                            rating notes]

        let(:id) { create(:user).id }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 0 }
        run_test!
      end
    end

    patch 'Updates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          first_name: { type: :string },
          last_name: { type: :string },
          middle_name: { type: :string },
          email: { type: :string },
          phone: { type: :string },
          birthday: { type: :string },
          role: { type: :string },
          status: { type: :string },
          work_email: { type: :string },
          work_phone: { type: :string },
          rating: { type: :integer },
          notes: { type: :text }
        },
        required: %w[first_name last_name middle_name email phone birthday role status work_email work_phone rating
                     notes]
      }

      response '200', 'user updated' do
        let(:user) do
          { first_name: 'test', last_name: 'test', middle_name: 'test', email: 'test', phone: 'test', birthday: 'test', role: 'test', status: 'test',
            work_email: 'test', work_phone: 'test', rating: 'test', notes: 'test' }
        end
        let(:id) { create(:user).id }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { first_name: 'test' } }
        let(:id) { create(:user).id }
        run_test!
      end
    end

    delete 'Deletes a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '204', 'user deleted' do
        let(:id) { create(:user).id }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 0 }
        run_test!
      end
    end
  end
end
