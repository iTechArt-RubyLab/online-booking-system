module Api
  module V1
    class SalonsSocialNetworksController < ApplicationController
      before_action :set_salons_social_network, only: %i[update destroy]

      def index
        @salons_social_networks = SalonsSocialNetwork.where(salon_id: params[:salon_id]).all
        render json: convert_to_json(@salons_social_networks)
      end

      def show
        render json: convert_to_json(@salons_social_network)
      end

      def create
        @salons_social_network = SalonsSocialNetwork.new(salons_social_network_params)

        if @salons_social_network.save
          render json: convert_to_json(@salons_social_network)
        else
          render json: { error: @salons_social_network.errors.full_messages }
        end
      end

      def update
        if @salons_social_network.update(salons_social_network_params)
          render json: convert_to_json(@salons_social_network)
        else
          render json: { error: 'Update not update SalonsSocialNetwork' }, status: :unprocessable_entity
        end
      end

      def destroy
        if @salons_social_network.destroy
          render json: convert_to_json(@salons_social_network)
        else
          render json: { message: 'Unable to delete SalonsSocialNetwork' }, status: :unprocessable_entity
        end
      end

      private

      def convert_to_json(object)
        SalonsSocialNetworkSerializer.new(object).serializable_hash.to_json
      end

      def set_salons_social_network
        @salons_social_network = SalonsSocialNetwork.find(params[:id])
      end

      def salons_social_network_params
        params.require(:salons_social_network).permit(:salon_id, :social_network_id, :link)
      end
    end
  end
end
