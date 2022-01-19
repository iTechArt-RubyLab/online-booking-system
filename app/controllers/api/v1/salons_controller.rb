module Api
  module V1
    class SalonsController < ApplicationController
      def index
        @salons = Salon.all
        render json: @salons
      end

      def show
        salon

        if salon
          render json: salon
        else
          render json: { error: 'Error creating review.' }
        end
      end

      def create
        @salon = Salon.new(salon_params)

        if @salon.save!
          render json: @salon
        else
          render json: { error: @salon.errors.full_messages }
        end
      end

      def update
        salon

        if salon.update(salon_params)
          render json: { message: 'Salon was successfully updated' }
        else
          render json: { error: 'Update not update salon' }
        end
      end

      def destroy
        salon

        if salon.destroy
          render json: { message: 'Salon was successfully updated' }
        else
          render json: { error: 'Unable to delete salon' }
        end
      end

      def salon
        @salon ||= Salon.find(params[:id])
      end

      def salon_params
        params.require(:salon).permit(%i[name address phone email notes owner_id])
      end
      private :salon, :salon_params
    end
  end
end
