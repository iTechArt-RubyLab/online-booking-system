module Api
  module V1
    class SalonsSocialNetworksController < ApplicationController
      before_action :set_salons_social_network, only: %i[update destroy]

      # GET /salons/1/salons_social_networks
      def index
        salons_social_networks = SalonsSocialNetwork.where(salon_id: params[:salon_id]).all
        render json: salons_social_networks
      end

      # GET /salons/1/salons_social_networks/1
      def show
        render json: set_salons_social_network
      end

      # POST /salons/1/salons_social_networks
      def create
        @salons_social_network = SalonsSocialNetwork.new(salons_social_network_params)

        if @salons_social_network.save
          render json: @salons_social_network
        else
          render json: { error: @salons_social_network.errors.full_messages }
        end
      end

      # PUT /salons/1/salons_social_networks/1
      def update
        if set_salons_social_network.update(salons_social_network_params)
          render json: { message: 'SalonsSocialNetwork was successfully updated' }
        else
          render json: { error: 'Update not update SalonsSocialNetwork' }, status: :unprocessable_entity
        end
      end

      # DELETE /salons/1/salons_social_networks/1
      def destroy
        if set_salons_social_network.destroy
          render json: { message: 'SalonsSocialNetwork was successfully destroyed' }
        else
          render json: { message: 'Unable to delete SalonsSocialNetwork' }, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_salons_social_network
        @salons_social_network = SalonsSocialNetwork.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def salons_social_network_params
        params.require(:salons_social_network).permit(:salon_id, :social_network_id, :link)
      end
    end
  end
end
