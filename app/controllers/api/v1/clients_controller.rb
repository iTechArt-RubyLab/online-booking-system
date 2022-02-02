module Api
  module V1
    class ClientsController < ApplicationController
      before_action :find_client, only: %i[show update destroy]

      def index
        @clients =
          if params[:sort]
            Client.order(Client::SORT_FIELDS).paginate(page: params[:page], per_page: 15)
          else
            Client.paginate(page: params[:page], per_page: 15)
          end
        render json: @clients
      end

      def show
        render json: @client
      end

      def create
        @client = Client.new(client_params)

        if @client.save!
          render json: @client
        else
          render json: { error: 'Error creating client.' }, status: :unprocessable_entity
        end
      end

      def update
        if @client.update(client_params)
          render json: @client
        else
          render json: { error: 'Error updating client.' }, status: :unprocessable_entity
        end
      end

      def destroy
        if @client.destroy
          render json: @client
        else
          render json: { error: 'Error deleting client.' }, status: :unprocessable_entity
        end
      end

      private

      def client_params
        params.require(:client).permit(%i[first_name last_name middle_name email phone
                                          birthday notes image_url])
      end

      def find_client
        @client = Client.find(params[:id])
      end
    end
  end
end
