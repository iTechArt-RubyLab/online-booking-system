module Api
  module V1
    class SalonsController < ApplicationController
      before_action :set_salon, only: %i[show update destroy]

      attr_accessor :salon

      def index

        if params[:sort]
          sort_params = params[:sort]

          if sort_params[:name]
            sort_field = :name
            sort_order = sort_params[:name]
          end

          if sort_params[:email]
            sort_field = :email
            sort_order = sort_params[:email]
          end

          @salons = Salon.order(sort_field => sort_order)
          render json: @salons
        else
          @salons = Salon.all
          render json: @salons
        end
      end

      def show
        if salon
          render json: salon
        else
          render json: { error: 'Error creating review.' }
        end
      end

      def create
        @salon = Salon.new(salon_params)

        if salon.save!
          render json: salon
        else
          render json: { error: salon.errors.full_messages }
        end
      end

      def update
        if salon.update(salon_params)
          render json: { message: 'Salon was successfully updated' }
        else
          render json: { error: 'Update not update salon' }, status: :unprocessable_entity
        end
      end

      def destroy
        if salon.destroy
          render json: { message: 'Salon was successfully updated' }
        else
          render json: { error: 'Unable to delete salon' }, status: :unprocessable_entity
        end
      end

      private

      def set_salon
        @salon = Salon.find(params[:id])
      end

      def salon_params
        params.require(:salon).permit(%i[name address phone email notes owner_id])
      end
    end
  end
end
