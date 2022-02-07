module Api
  module V1
    class ClientsController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create update destroy]
      before_action :find_client, only: %i[show update destroy]
      before_action :authorize_client
      after_action :verify_authorized

      def index
        @clients =
          if params[:sort]
            Client.order(Client::SORT_FIELDS).paginate(page: params[:page], per_page: 15)
          else
            Client.paginate(page: params[:page], per_page: 15)
          end

        render json: convert_to_json(@clients)
      end

      def show
        render json: convert_to_json(@client)
      end

      def create
        @client = Client.new(client_params)

        if @client.save!
          render json: convert_to_json(@client)
        else
          render json: convert_to_json(errors(@client)), status: :unprocessable_entity
        end
      end

      def update
        if @client.update(client_params)
          render json: convert_to_json(@client)
        else
          render json: convert_to_json(errors(@client)), status: :unprocessable_entity
        end
      end

      def destroy
        if @client.destroy
          render json: convert_to_json(@client)
        else
          render json: convert_to_json(errors(@client)), status: :unprocessable_entity
        end
      end

      private

      def client_params
        params.require(:client).permit(%i[first_name last_name middle_name email phone
                                          birthday notes image_url])
      end

      def convert_to_json(object)
        ClientSerializer.new(object).serializable_hash.to_json
      end

      def find_client
        @client = Client.find(params[:id])
      end

      def authorize_client
        authorize @client
      end
    end
  end
end
